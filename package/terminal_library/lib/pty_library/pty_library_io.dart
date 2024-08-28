// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/dart/executable_type/executable_type.dart';
import 'src/pty_library_bindings_generated.dart';

/// PtyLibrary represents a process running in a pseudo-terminal.
///
/// To create a PtyLibrary, use [PtyLibrary.start].
class PtyLibrary {
  static String libraryName = 'terminal_library_flutter_pty';

  bool isInitialized = false;
  static final DynamicLibrary _dylib = () {
    if (Platform.isMacOS || Platform.isIOS) {
      return DynamicLibrary.open('${libraryName}.framework/${libraryName}');
    }
    if (Platform.isAndroid || Platform.isLinux) {
      if (Dart.executable_type == ExecutableType.cli) {
        return DynamicLibrary.open('${libraryName}.so');
      }
      return DynamicLibrary.open('lib${libraryName}.so');
    }
    if (Platform.isWindows) {
      return DynamicLibrary.open('${libraryName}.dll');
    }
    return DynamicLibrary.process();
  }();

  static final _bindings = FlutterPtyLibraryBindings(_dylib);

  static final _init = () {
    return _bindings.Dart_InitializeApiDL(NativeApi.initializeApiDLData);
  }();

  static void ensureInitialized({
    String? libraryPty,
  }) {
    if (libraryPty != null) {
      libraryName = libraryPty;
    }
  }

  static void _ensureInitialized() {
    if (_init != 0) {
      throw StateError('Failed to initialize native bindings');
    }
  }

  final String executable;

  final List<String> arguments;

  /// Spawns a process in a pseudo-terminal. The arguments have the same meaning
  /// as in [Process.start].
  /// [ackRead] indicates if the pty should wait for a call to [PtyLibrary.ackRead] before sending the next data.
  PtyLibrary.start({
    required this.executable,
    this.arguments = const [],
    String? workingDirectory,
    Map<String, String>? environment,
    int rows = 25,
    int columns = 80,
    bool ackRead = false,
  }) {
    _ensureInitialized();

    final effectiveEnv = <String, String>{};

    effectiveEnv['TERM'] = 'xterm-256color';
    // Without this, tools like "vi" produce sequences that are not UTF-8 friendly
    effectiveEnv['LANG'] = 'en_US.UTF-8';

    const envValuesToCopy = {'LOGNAME', 'USER', 'DISPLAY', 'LC_TYPE', 'HOME', 'PATH'};

    for (var entry in Platform.environment.entries) {
      if (envValuesToCopy.contains(entry.key)) {
        effectiveEnv[entry.key] = entry.value;
      }
    }

    if (environment != null) {
      for (var entry in environment.entries) {
        effectiveEnv[entry.key] = entry.value;
      }
    }

    // build argv
    final argv = calloc<Pointer<Utf8>>(arguments.length + 2);

    argv.elementAt(0).value = executable.toNativeUtf8();
    for (var i = 0; i < arguments.length; i++) {
      argv.elementAt(i + 1).value = arguments[i].toNativeUtf8();
    }
    argv.elementAt(arguments.length + 1).value = nullptr;

    //build env
    final envp = calloc<Pointer<Utf8>>(effectiveEnv.length + 1);
    for (var i = 0; i < effectiveEnv.length; i++) {
      final entry = effectiveEnv.entries.elementAt(i);
      envp.elementAt(i).value = '${entry.key}=${entry.value}'.toNativeUtf8();
    }
    envp.elementAt(effectiveEnv.length).value = nullptr;

    final options = calloc<PtyLibraryOptions>();
    options.ref.rows = rows;
    options.ref.cols = columns;
    options.ref.executable = executable.toNativeUtf8().cast();
    options.ref.arguments = argv.cast();
    options.ref.environment = envp.cast();
    options.ref.stdout_port = _stdoutPort.sendPort.nativePort;
    options.ref.exit_port = _exitPort.sendPort.nativePort;
    options.ref.ackRead = ackRead;

    if (workingDirectory != null) {
      options.ref.working_directory = workingDirectory.toNativeUtf8().cast();
    } else {
      options.ref.working_directory = nullptr;
    }

    _handle = _bindings.pty_create(options);

    calloc.free(options);

    if (_handle == nullptr) {
      throw StateError('Failed to create PTY: ${_getPtyLibraryError()}');
    }

    _exitPort.first.then(_onExitCode);
  }

  final _stdoutPort = ReceivePort();

  final _exitPort = ReceivePort();

  final _exitCodeCompleter = Completer<int>();

  late final Pointer<PtyLibraryHandle> _handle;

  /// The output stream from the pseudo-terminal. Note that pseudo-terminals
  /// do not distinguish between stdout and stderr.
  Stream<Uint8List> get output => _stdoutPort.cast();

  /// A `Future` which completes with the exit code of the process
  /// when the process completes.
  ///
  /// The handling of exit codes is platform specific.
  ///
  /// On Linux and OS X a normal exit code will be a positive value in
  /// the range `[0..255]`. If the process was terminated due to a signal
  /// the exit code will be a negative value in the range `[-255..-1]`,
  /// where the absolute value of the exit code is the signal
  /// number. For example, if a process crashes due to a segmentation
  /// violation the exit code will be -11, as the signal SIGSEGV has the
  /// number 11.
  ///
  /// On Windows a process can report any 32-bit value as an exit
  /// code. When returning the exit code this exit code is turned into
  /// a signed value. Some special values are used to report
  /// termination due to some system event. E.g. if a process crashes
  /// due to an access violation the 32-bit exit code is `0xc0000005`,
  /// which will be returned as the negative number `-1073741819`. To
  /// get the original 32-bit value use `(0x100000000 + exitCode) &
  /// 0xffffffff`.
  ///
  /// There is no guarantee that [output] have finished reporting the buffered
  /// output of the process when the returned future completes.
  /// To be sure that all output is captured, wait for the done event on the
  /// streams.
  Future<int> get exitCode => _exitCodeCompleter.future;

  /// The process id of the process running in the pseudo-terminal.
  int get pid => _bindings.pty_getpid(_handle);

  /// Write data to the pseudo-terminal.
  void write(Uint8List data) {
    final buf = malloc<Int8>(data.length);
    buf.asTypedList(data.length).setAll(0, data);
    _bindings.pty_write(_handle, buf.cast(), data.length);
    malloc.free(buf);
  }

  /// Resize the pseudo-terminal.
  void resize(int rows, int cols) {
    _bindings.pty_resize(_handle, rows, cols);
  }

  /// Kill the process running in the pseudo-terminal.
  ///
  /// When possible, [signal] will be sent to the process. This includes
  /// Linux and OS X. The default signal is [ProcessSignal.sigterm]
  /// which will normally terminate the process.
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    return Process.killPid(pid, signal);
  }

  /// indicates that a data chunk has been processed.
  /// This is needed when ackRead is set to true as the pty will wait for this signal to happen
  /// before any additional data is sent.
  void ackRead() {
    _bindings.pty_ack_read(_handle);
  }

  void _onExitCode(dynamic exitCode) {
    _stdoutPort.close();
    _exitPort.close();
    _exitCodeCompleter.complete(exitCode);
  }

  static String? _getPtyLibraryError() {
    final error = _bindings.pty_error();

    if (error == nullptr) {
      return null;
    }

    return error.cast<Utf8>().toDartString();
  }
}

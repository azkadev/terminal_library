// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:async';

import 'dart:typed_data';

import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/dart/executable_type/executable_type.dart';
import 'package:general_lib/event_emitter/event_emitter.dart';
import 'package:io_universe/io_universe.dart';

/// PtyLibrary represents a process running in a pseudo-terminal.
///
/// To create a PtyLibrary, use [PtyLibrary.start].
abstract class TerminalPtyLibraryBase {
  final String executable;
  late final List<String> arguments;

  final String? workingDirectory;
  final Map? environment;
  final int rows;
  final int columns;
  final bool isAckRead;

  bool isInitialized = false;

  static bool is_dynamic_library_pty_initialized = false;

  static late final int pty_library_init;

  late final String libraryPtyPath;

  final EventEmitter event_emitter = EventEmitter();
  final String event_output = "ouput";
  final String event_input = "input";

  /// Spawns a process in a pseudo-terminal. The arguments have the same meaning
  /// as in [Process.start].
  /// [ackRead] indicates if the pty should wait for a call to [PtyLibrary.ackRead] before sending the next data.
  TerminalPtyLibraryBase({
    this.executable = "sh",
    this.workingDirectory,
    String? libraryPtyPath,
    List<String>? arguments,
    this.environment,
    this.rows = 25,
    this.columns = 80,
    this.isAckRead = false,
  }) {
    if (arguments != null) {
      this.arguments = arguments;
    } else {
      this.arguments = [];
    }
    if (libraryPtyPath != null) {
      this.libraryPtyPath = libraryPtyPath;
    } else {
      this.libraryPtyPath = TerminalPtyLibraryBase.defaultLibraryPtyPath;
    }
  }

  static String get defaultLibraryPtyPath {
    if (Platform.isMacOS || Platform.isIOS) {
      return "libterminal_pty.framework/libterminal_pty";
    }
    if (Platform.isAndroid || Platform.isLinux) {
      if (Dart.executable_type == ExecutableType.cli) {
        return 'libterminal_library_pty.so';
      }
      return 'libterminal_pty.so';
    }

    if (Platform.isWindows) {
      return 'libterminal_pty.dll';
    }
    return "";
  }

  static String get defaultShell {
    if (Platform.isMacOS || Platform.isLinux) {
      return Platform.environment['SHELL'] ?? 'bash';
    }
    if (Platform.isWindows) {
      return 'cmd.exe';
    }
    return 'sh';
  }

  void ensureInitialized() {
    if (isInitialized) {
      return;
    }
  }

  EventEmitterListener on({
    required String eventName,
    required FutureOr<dynamic> Function(
      dynamic update,
      TerminalPtyLibraryBase terminalPtyLibraryBase,
    ) onCallback,
  }) {
    return event_emitter.on(
      eventName: eventName,
      onCallback: (listener, update) async {
        await onCallback(update, this);
      },
    );
  }

  // /// The output stream from the pseudo-terminal. Note that pseudo-terminals
  // /// do not distinguish between stdout and stderr.
  // Stream<Uint8List> get output async* {
  //   return;
  // }

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
  Future<int> get exitCode async => 0;

  /// The process id of the process running in the pseudo-terminal.
  int get pid => 0;

  /// Write data to the pseudo-terminal.
  void write(Uint8List data) {
    return;
  }

  /// Resize the pseudo-terminal.
  void resize(int rows, int cols) {}

  /// Kill the process running in the pseudo-terminal.
  ///
  /// When possible, [signal] will be sent to the process. This includes
  /// Linux and OS X. The default signal is [ProcessSignal.sigterm]
  /// which will normally terminate the process.
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    return true;
  }

  /// indicates that a data chunk has been processed.
  /// This is needed when ackRead is set to true as the pty will wait for this signal to happen
  /// before any additional data is sent.
  void ackRead() {}
}

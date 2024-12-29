// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, unnecessary_string_interpolations, deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:general_lib/event_emitter/event_emitter.dart';

import 'base.dart';

/// TerminalPtyLibrary represents a process running in a pseudo-terminal.
///
/// To create a TerminalPtyLibrary, use [TerminalPtyLibrary.start].
class TerminalPtyLibrary extends TerminalPtyLibraryBase {
  TerminalPtyLibrary({
    super.executable,
    super.workingDirectory,
    super.libraryPtyPath,
    super.arguments,
    super.columns,
    super.environment,
    super.isAckRead,
    super.rows,
  }) {
    openLibrary(libraryPath: libraryPtyPath);
  }

  static void openLibrary({
    required String libraryPath,
  }) {}

  static String get defaultShell {
    return 'sh';
  }

  // @override
  // // TODO: implement output
  // Stream<Uint8List> get output async* {}
  //
  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    event_emitter.clear();
    return true;
  }

  @override
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
        await onCallback(terminalTitle(title: "~"), this);

        // await onCallback(Uint8List.fromList([13,13,27,91,48,109,27,91,50,55,109,27,91,50,52,109,27,91,74,27,91,48,49,59,51,50,109,226,158,156,32,32,27,91,51,54,109,101,120,97,109,112,108,101,27,91,48,48,109,32,27,91,48,49,59,51,52,109,103,105,116,58,40,27,91,51,49,109,109,97,105,110,27,91,51,52,109,41,32,27,91,51,51,109,226,156,151,27,91,48,48,109,32,27,91,75]), this);
      },
    );
  }

  String terminalTitle({
    String title = "~",
  }) {
    return "\r\r\u001b[0m\u001b[27m\u001b[24m\u001b[J\u001b[01;32m➜  \u001b[36m${title}\u001b[00m \u001b[K";
  }

  @override
  void write(Uint8List data) {
    event_emitter.emit(
      eventName: event_output,
      value: data,
    );
  }
}

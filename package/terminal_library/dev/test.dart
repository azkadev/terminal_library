import 'dart:io';
import 'dart:typed_data';

import 'package:terminal_library/pty_library/pty_library.dart';

void main(List<String> args) {
  print("start");
  TerminalPtyLibrary ptyLibrary = TerminalPtyLibrary(
    executable: "sh",
    // libraryPtyPath: "/home/galaxeus/Documents/galaxeus/app/terminal_library/native_lib/build/libterminal_pty.so"
  );
  ptyLibrary.ensureInitialized();
  ptyLibrary.on(
    eventName: ptyLibrary.event_output,
    onCallback: (update, terminalPtyLibraryBase) {
      if (update is Uint8List) {
        stdout.add(update);
      }
    },
  );
  stdin.listen((event) {
    try {
      ptyLibrary.write(Uint8List.fromList(event));
    } catch (e) {}
  });
}

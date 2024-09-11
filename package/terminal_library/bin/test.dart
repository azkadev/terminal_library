import 'dart:convert'; 

import 'package:terminal_library/pty_library/pty_library.dart';

void main(List<String> args) {
  print("start");
  TerminalPtyLibrary ptyLibrary = TerminalPtyLibrary(
    executable: TerminalPtyLibrary.defaultShell,
    // libraryPtyPath: "/home/galaxeus/Documents/galaxeus/app/terminal_library/native_lib/build/libterminal_pty.so"
  );
  ptyLibrary.ensureInitialized();

  ptyLibrary.output.listen((event) {
    if (event.isNotEmpty) {
      try {
        print(utf8.decode(event,allowMalformed: true));
        // stdout.add(utf8.encode("ALO: ${utf8.decode(event, allowMalformed: true)}"));
        // stdout.add(utf8.encode("PTY: ${utf8.decode(event,allowMalformed: true)}"));
      } catch (e) {}
    }
  });
  // stdin.listen((event) {
  //   try {
  //     ptyLibrary.write(Uint8List.fromList(event));
  //   } catch (e) {}
  // });
  print("oke");
  ptyLibrary.write(utf8.encode("echo \"ini dari ani\""));
}

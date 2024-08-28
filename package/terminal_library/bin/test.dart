import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:terminal_library/pty_library/pty_library.dart';

void main(List<String> args) {
  print("start");
  PtyLibrary.ensureInitialized(
    libraryPty: "/home/galaxeus/Documents/galaxeus/app/terminal_library/package/terminal_library/bin/libterminal_library_flutter_pty.so",
  );
  PtyLibrary ptyLibrary = PtyLibrary.start(
    executable: "bash",
  );

  ptyLibrary.output.listen((event) {
    if (event.isNotEmpty) {
      try {
        stdout.add(event);
      } catch (e) {}
    }
  });
  stdin.listen((event) {
    try {
      ptyLibrary.write(Uint8List.fromList(event));
    } catch (e) {}
  });
  print("oke");
}

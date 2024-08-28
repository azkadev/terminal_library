 import 'dart:io';
import 'dart:typed_data';

import 'package:terminal_library/pty_library/pty_library.dart';

void main(List<String> args) {
  print("start");
  PtyLibrary ptyLibrary = PtyLibrary(
    executable: PtyLibrary.defaultShell,
  );
  ptyLibrary.ensureInitialized();
  
  ptyLibrary.output.listen((event) {
    if (event.isNotEmpty) {
      try {
        stdout.add(event);
        // stdout.add(utf8.encode("PTY: ${utf8.decode(event,allowMalformed: true)}"));
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

import 'package:terminal_library/ssh_library/core/socket/ssh_socket.dart';

Future<SSHSocket> connectNativeSocket(
  String host,
  int port, {
  Duration? timeout,
}) async {
  throw UnimplementedError(
    'Native socket is not supported on web. '
    'To use dartssh2 in browser, you have to bring your own implementation '
    'of SSHSocket.',
  );
}

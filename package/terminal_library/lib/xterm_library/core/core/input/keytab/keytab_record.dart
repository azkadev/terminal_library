import 'package:terminal_library/xterm_library/core/core/input/keys.dart';
import 'package:terminal_library/xterm_library/core/core/input/keytab/keytab_escape.dart';

/// UncompleteDocumentation
enum KeytabActionType {
  /// UncompleteDocumentation
  input,

  /// UncompleteDocumentation
  shortcut,
}

/// UncompleteDocumentation
class KeytabAction {
  /// UncompleteDocumentation
  KeytabAction(this.type, this.value);

  /// UncompleteDocumentation
  final KeytabActionType type;

  /// UncompleteDocumentation
  final String value;

  /// UncompleteDocumentation

  String unescapedValue() {
    if (type == KeytabActionType.input) {
      return keytabUnescape(value);
    } else {
      return value;
    }
  }

  @override
  String toString() {
    switch (type) {
      case KeytabActionType.input:
        return '"$value"';
      case KeytabActionType.shortcut:
        return value;
    }
  }
}

/// UncompleteDocumentation
class KeytabRecord {
  /// UncompleteDocumentation
  KeytabRecord({
    required this.qtKeyName,
    required this.key,
    required this.action,
    required this.alt,
    required this.ctrl,
    required this.shift,
    required this.anyModifier,
    required this.ansi,
    required this.appScreen,
    required this.keyPad,
    required this.appCursorKeys,
    required this.appKeyPad,
    required this.newLine,
    required this.macos,
  });

  /// UncompleteDocumentation
  String qtKeyName;

  /// UncompleteDocumentation
  TerminalLibraryFlutterKey key;

  /// UncompleteDocumentation
  KeytabAction action;

  /// UncompleteDocumentation

  /// UncompleteDocumentation
  bool? alt;

  /// UncompleteDocumentation
  bool? ctrl;

  /// UncompleteDocumentation
  bool? shift;

  /// UncompleteDocumentation
  bool? anyModifier;

  /// UncompleteDocumentation
  bool? ansi;

  /// UncompleteDocumentation

  bool? appScreen;

  /// UncompleteDocumentation

  bool? keyPad;

  /// UncompleteDocumentation
  bool? appCursorKeys;

  /// UncompleteDocumentation
  bool? appKeyPad;

  /// UncompleteDocumentation
  bool? newLine;

  /// UncompleteDocumentation
  bool? macos;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('$qtKeyName ');

    if (alt != null) {
      buffer.write(_toMode(alt!, 'Alt'));
    }

    if (ctrl != null) {
      buffer.write(_toMode(ctrl!, 'Control'));
    }

    if (shift != null) {
      buffer.write(_toMode(shift!, 'Shift'));
    }

    if (anyModifier != null) {
      buffer.write(_toMode(anyModifier!, 'AnyMod'));
    }

    if (ansi != null) {
      buffer.write(_toMode(ansi!, 'Ansi'));
    }

    if (appScreen != null) {
      buffer.write(_toMode(appScreen!, 'AppScreen'));
    }

    if (keyPad != null) {
      buffer.write(_toMode(keyPad!, 'KeyPad'));
    }

    if (appCursorKeys != null) {
      buffer.write(_toMode(appCursorKeys!, 'AppCuKeys'));
    }

    if (appKeyPad != null) {
      buffer.write(_toMode(appKeyPad!, 'AppKeyPad'));
    }

    if (newLine != null) {
      buffer.write(_toMode(newLine!, 'NewLine'));
    }

    if (macos != null) {
      buffer.write(_toMode(macos!, 'Mac'));
    }

    buffer.write(' : $action');

    return buffer.toString();
  }

  static String _toMode(bool status, String mode) {
    if (status == true) {
      return '+$mode';
    }

    if (status == false) {
      return '-$mode';
    }

    return '';
  }
}

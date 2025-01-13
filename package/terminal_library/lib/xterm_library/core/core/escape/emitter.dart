/// UncompleteDocumentation
class EscapeEmitter {
  /// UncompleteDocumentation
  const EscapeEmitter();

  /// UncompleteDocumentation
  String primaryDeviceAttributes() {
    return '\x1b[?1;2c';
  }

  /// UncompleteDocumentation
  String secondaryDeviceAttributes() {
    const model = 0;
    const version = 0;
    return '\x1b[>$model;$version;0c';
  }

  /// UncompleteDocumentation
  String tertiaryDeviceAttributes() {
    return '\x1bP!|00000000\x1b\\';
  }

  /// UncompleteDocumentation
  String operatingStatus() {
    return '\x1b[0n';
  }

  /// UncompleteDocumentation
  String cursorPosition(int x, int y) {
    return '\x1b[$y;${x}R';
  }

  /// UncompleteDocumentation
  String bracketedPaste(String text) {
    return '\x1b[200~$text\x1b[201~';
  }

  /// UncompleteDocumentation
  String size(int rows, int cols) {
    return '\x1b[8;$rows;${cols}t';
  }
}

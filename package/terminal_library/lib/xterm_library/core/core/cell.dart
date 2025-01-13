import 'package:terminal_library/xterm_library/core/utils/hash_values.dart';

/// UncompleteDocumentation
class CellData {
  /// UncompleteDocumentation
  CellData({
    required this.foreground,
    required this.background,
    required this.flags,
    required this.content,
  });

  /// UncompleteDocumentation

  factory CellData.empty() {
    return CellData(
      foreground: 0,
      background: 0,
      flags: 0,
      content: 0,
    );
  }

  /// UncompleteDocumentation
  int foreground;

  /// UncompleteDocumentation
  int background;

  /// UncompleteDocumentation
  int flags;

  /// UncompleteDocumentation
  int content;

  /// UncompleteDocumentation
  int getHash() {
    return hashValues(foreground, background, flags, content);
  }

  @override
  String toString() {
    return 'CellData{foreground: $foreground, background: $background, flags: $flags, content: $content}';
  }
}

/// UncompleteDocumentation

abstract class CellAttr {
  /// UncompleteDocumentation
  static const bold = 1 << 0;

  /// UncompleteDocumentation
  static const faint = 1 << 1;

  /// UncompleteDocumentation
  static const italic = 1 << 2;

  /// UncompleteDocumentation
  static const underline = 1 << 3;

  /// UncompleteDocumentation
  static const blink = 1 << 4;

  /// UncompleteDocumentation
  static const inverse = 1 << 5;

  /// UncompleteDocumentation
  static const invisible = 1 << 6;

  /// UncompleteDocumentation
  static const strikethrough = 1 << 7;
}

/// UncompleteDocumentation
abstract class CellColor {
  /// UncompleteDocumentation
  static const valueMask = 0xFFFFFF;

  /// UncompleteDocumentation
  static const typeShift = 25;

  /// UncompleteDocumentation
  static const typeMask = 3 << typeShift;

  /// UncompleteDocumentation
  static const normal = 0 << typeShift;

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  static const named = 1 << typeShift;

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  static const palette = 2 << typeShift;

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  static const rgb = 3 << typeShift;
}

/// UncompleteDocumentation

abstract class CellContent {
  /// UncompleteDocumentation
  /// UncompleteDocumentation
  static const codepointMask = 0x1fffff;

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  static const widthShift = 22;
  // static const widthMask = 3 << widthShift;
}

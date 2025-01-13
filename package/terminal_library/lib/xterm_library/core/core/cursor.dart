import 'package:terminal_library/xterm_library/core/core/cell.dart';

/// UncompleteDocumentation
class CursorStyle {
  /// UncompleteDocumentation
  int foreground;

  /// UncompleteDocumentation
  int background;

  /// UncompleteDocumentation
  int attrs;

  /// UncompleteDocumentation
  CursorStyle({this.foreground = 0, this.background = 0, this.attrs = 0});

  /// UncompleteDocumentation
  static final empty = CursorStyle();

  /// UncompleteDocumentation
  void setBold() {
    attrs |= CellAttr.bold;
  }

  /// UncompleteDocumentation
  void setFaint() {
    attrs |= CellAttr.faint;
  }

  /// UncompleteDocumentation
  void setItalic() {
    attrs |= CellAttr.italic;
  }

  /// UncompleteDocumentation
  void setUnderline() {
    attrs |= CellAttr.underline;
  }

  /// UncompleteDocumentation
  void setBlink() {
    attrs |= CellAttr.blink;
  }

  /// UncompleteDocumentation
  void setInverse() {
    attrs |= CellAttr.inverse;
  }

  /// UncompleteDocumentation
  void setInvisible() {
    attrs |= CellAttr.invisible;
  }

  /// UncompleteDocumentation
  void setStrikethrough() {
    attrs |= CellAttr.strikethrough;
  }

  /// UncompleteDocumentation
  void unsetBold() {
    attrs &= ~CellAttr.bold;
  }

  /// UncompleteDocumentation
  void unsetFaint() {
    attrs &= ~CellAttr.faint;
  }

  /// UncompleteDocumentation

  void unsetItalic() {
    attrs &= ~CellAttr.italic;
  }

  /// UncompleteDocumentation
  void unsetUnderline() {
    attrs &= ~CellAttr.underline;
  }

  /// UncompleteDocumentation
  void unsetBlink() {
    attrs &= ~CellAttr.blink;
  }

  /// UncompleteDocumentation
  void unsetInverse() {
    attrs &= ~CellAttr.inverse;
  }

  /// UncompleteDocumentation
  void unsetInvisible() {
    attrs &= ~CellAttr.invisible;
  }

  /// UncompleteDocumentation
  void unsetStrikethrough() {
    attrs &= ~CellAttr.strikethrough;
  }

  /// UncompleteDocumentation

  bool get isBold => (attrs & CellAttr.bold) != 0;

  /// UncompleteDocumentation
  bool get isFaint => (attrs & CellAttr.faint) != 0;

  /// UncompleteDocumentation
  bool get isItalis => (attrs & CellAttr.italic) != 0;

  /// UncompleteDocumentation
  bool get isUnderline => (attrs & CellAttr.underline) != 0;

  /// UncompleteDocumentation
  bool get isBlink => (attrs & CellAttr.blink) != 0;

  /// UncompleteDocumentation
  bool get isInverse => (attrs & CellAttr.inverse) != 0;

  /// UncompleteDocumentation
  bool get isInvisible => (attrs & CellAttr.invisible) != 0;

  /// UncompleteDocumentation
  void setForegroundColor16(int color) {
    foreground = color | CellColor.named;
  }

  /// UncompleteDocumentation
  void setForegroundColor256(int color) {
    foreground = color | CellColor.palette;
  }

  /// UncompleteDocumentation
  void setForegroundColorRgb(int r, int g, int b) {
    foreground = (r << 16) | (g << 8) | b | CellColor.rgb;
  }

  /// UncompleteDocumentation
  void resetForegroundColor() {
    foreground = 0; // | CellColor.normal;
  }

  /// UncompleteDocumentation
  void setBackgroundColor16(int color) {
    background = color | CellColor.named;
  }

  /// UncompleteDocumentation
  void setBackgroundColor256(int color) {
    background = color | CellColor.palette;
  }

  /// UncompleteDocumentation
  void setBackgroundColorRgb(int r, int g, int b) {
    background = (r << 16) | (g << 8) | b | CellColor.rgb;
  }

  /// UncompleteDocumentation
  void resetBackgroundColor() {
    background = 0; // | CellColor.normal;
  }

  /// UncompleteDocumentation
  void reset() {
    foreground = 0;
    background = 0;
    attrs = 0;
  }
}

/// UncompleteDocumentation
class CursorPosition {
  /// UncompleteDocumentation
  int x;

  /// UncompleteDocumentation

  int y;

  /// UncompleteDocumentation
  CursorPosition(this.x, this.y);
}

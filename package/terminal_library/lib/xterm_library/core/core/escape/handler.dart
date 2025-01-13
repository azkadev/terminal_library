import 'package:terminal_library/xterm_library/core/core/mouse/mode.dart';

/// UncompleteDocumentation
abstract class EscapeHandler {
  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void writeChar(int char);

  /* SBC */
  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void bell();

  /// UncompleteDocumentation

  /// UncompleteDocumentation
  void backspaceReturn();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void tab();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void lineFeed();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void carriageReturn();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void shiftOut();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void shiftIn();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void unknownSBC(int char);

  /* ANSI sequence */
  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void saveCursor();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void restoreCursor();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void index();

  /// UncompleteDocumentation

  /// UncompleteDocumentation
  void nextLine();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void setTapStop();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void reverseIndex();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void designateCharset(int charset, int name);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void unkownEscape(int char);

  /* CSI */
  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void repeatPreviousCharacter(int n);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void setCursor(int x, int y);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void setCursorX(int x);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void setCursorY(int y);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void sendPrimaryDeviceAttributes();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void clearTabStopUnderCursor();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void clearAllTabStops();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void moveCursorX(int offset);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void moveCursorY(int n);

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void sendSecondaryDeviceAttributes();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void sendTertiaryDeviceAttributes();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void sendOperatingStatus();

  /// UncompleteDocumentation
  /// UncompleteDocumentation
  void sendCursorPosition();

  /// UncompleteDocumentation
  void setMargins(int i, [int? bottom]);

  /// UncompleteDocumentation
  void cursorNextLine(int amount);

  /// UncompleteDocumentation
  void cursorPrecedingLine(int amount);

  /// UncompleteDocumentation
  void eraseDisplayBelow();

  /// UncompleteDocumentation
  void eraseDisplayAbove();

  /// UncompleteDocumentation
  void eraseDisplay();

  /// UncompleteDocumentation
  void eraseScrollbackOnly();

  /// UncompleteDocumentation
  void eraseLineRight();

  /// UncompleteDocumentation
  void eraseLineLeft();

  /// UncompleteDocumentation
  void eraseLine();

  /// UncompleteDocumentation
  void insertLines(int amount);

  /// UncompleteDocumentation
  void deleteLines(int amount);

  /// UncompleteDocumentation
  void deleteChars(int amount);

  /// UncompleteDocumentation
  void scrollUp(int amount);

  /// UncompleteDocumentation
  void scrollDown(int amount);

  /// UncompleteDocumentation
  void eraseChars(int amount);

  /// UncompleteDocumentation
  void insertBlankChars(int amount);

  /// UncompleteDocumentation
  void unknownCSI(int finalByte);

  /* Modes */

  /// UncompleteDocumentation
  void setInsertMode(bool enabled);

  /// UncompleteDocumentation
  void setLineFeedMode(bool enabled);

  /// UncompleteDocumentation
  void setUnknownMode(int mode, bool enabled);

  /* DEC Private modes */

  /// UncompleteDocumentation
  void setCursorKeysMode(bool enabled);

  /// UncompleteDocumentation
  void setReverseDisplayMode(bool enabled);

  /// UncompleteDocumentation
  void setOriginMode(bool enabled);

  /// UncompleteDocumentation
  void setColumnMode(bool enabled);

  /// UncompleteDocumentation
  void setAutoWrapMode(bool enabled);

  /// UncompleteDocumentation
  void setMouseMode(MouseMode mode);

  /// UncompleteDocumentation
  void setCursorBlinkMode(bool enabled);

  /// UncompleteDocumentation
  void setCursorVisibleMode(bool enabled);

  /// UncompleteDocumentation
  void useAltBuffer();

  /// UncompleteDocumentation
  void useMainBuffer();

  /// UncompleteDocumentation
  void clearAltBuffer();

  /// UncompleteDocumentation
  void setAppKeypadMode(bool enabled);

  /// UncompleteDocumentation
  void setReportFocusMode(bool enabled);

  /// UncompleteDocumentation
  void setMouseReportMode(MouseReportMode mode);

  /// UncompleteDocumentation
  void setAltBufferMouseScrollMode(bool enabled);

  /// UncompleteDocumentation
  void setBracketedPasteMode(bool enabled);

  /// UncompleteDocumentation
  void setUnknownDecMode(int mode, bool enabled);

  /// UncompleteDocumentation
  void resize(int cols, int rows);

  /// UncompleteDocumentation
  void sendSize();

  /* Select Graphic Rendition (SGR) */

  /// UncompleteDocumentation
  void resetCursorStyle();

  /// UncompleteDocumentation
  void setCursorBold();

  /// UncompleteDocumentation
  void setCursorFaint();

  /// UncompleteDocumentation
  void setCursorItalic();

  /// UncompleteDocumentation
  void setCursorUnderline();

  /// UncompleteDocumentation
  void setCursorBlink();

  /// UncompleteDocumentation
  void setCursorInverse();

  /// UncompleteDocumentation
  void setCursorInvisible();

  /// UncompleteDocumentation
  void setCursorStrikethrough();

  /// UncompleteDocumentation
  void unsetCursorBold();

  /// UncompleteDocumentation
  void unsetCursorFaint();

  /// UncompleteDocumentation
  void unsetCursorItalic();

  /// UncompleteDocumentation
  void unsetCursorUnderline();

  /// UncompleteDocumentation
  void unsetCursorBlink();

  /// UncompleteDocumentation
  void unsetCursorInverse();

  /// UncompleteDocumentation
  void unsetCursorInvisible();

  /// UncompleteDocumentation
  void unsetCursorStrikethrough();

  /// UncompleteDocumentation
  void setForegroundColor16(int color);

  /// UncompleteDocumentation
  void setForegroundColor256(int index);

  /// UncompleteDocumentation
  void setForegroundColorRgb(int r, int g, int b);

  /// UncompleteDocumentation
  void resetForeground();

  /// UncompleteDocumentation
  void setBackgroundColor16(int color);

  /// UncompleteDocumentation
  void setBackgroundColor256(int index);

  /// UncompleteDocumentation
  void setBackgroundColorRgb(int r, int g, int b);

  /// UncompleteDocumentation
  void resetBackground();

  /// UncompleteDocumentation
  void unsupportedStyle(int param);

  /* OSC */

  /// UncompleteDocumentation
  void setTitle(String name);

  /// UncompleteDocumentation
  void setIconName(String name);

  /// UncompleteDocumentation
  void unknownOSC(String code, List<String> args);
}

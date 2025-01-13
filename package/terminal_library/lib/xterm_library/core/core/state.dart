import 'package:terminal_library/xterm_library/core/core/cursor.dart';
import 'package:terminal_library/xterm_library/core/core/mouse/mode.dart';

/// UncompleteDocumentation
abstract class TerminalLibraryFlutterState {
  /// UncompleteDocumentation
  int get viewWidth;

  /// UncompleteDocumentation
  int get viewHeight;

  /// UncompleteDocumentation
  CursorStyle get cursor;

  /// UncompleteDocumentation
  bool get reflowEnabled;

  /* Modes */
  /// UncompleteDocumentation
  bool get insertMode;

  /// UncompleteDocumentation
  bool get lineFeedMode;

  /// UncompleteDocumentation
  /* DEC Private modes */
  /// UncompleteDocumentation
  bool get cursorKeysMode;

  /// UncompleteDocumentation
  bool get reverseDisplayMode;

  /// UncompleteDocumentation
  bool get originMode;

  /// UncompleteDocumentation
  bool get autoWrapMode;

  /// UncompleteDocumentation
  MouseMode get mouseMode;

  /// UncompleteDocumentation
  MouseReportMode get mouseReportMode;

  /// UncompleteDocumentation
  bool get cursorBlinkMode;

  /// UncompleteDocumentation
  bool get cursorVisibleMode;

  /// UncompleteDocumentation
  bool get appKeypadMode;

  /// UncompleteDocumentation
  bool get reportFocusMode;

  /// UncompleteDocumentation
  bool get altBufferMouseScrollMode;

  /// UncompleteDocumentation
  bool get bracketedPasteMode;
}

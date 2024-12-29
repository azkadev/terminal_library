import 'package:terminal_library/xterm_library/core/core/buffer/cell_offset.dart';
import 'package:terminal_library/xterm_library/core/core/mouse/button_state.dart';
import 'package:terminal_library/xterm_library/core/core/mouse/mode.dart';
import 'package:terminal_library/xterm_library/core/core/mouse/button.dart';
import 'package:terminal_library/xterm_library/core/core/mouse/reporter.dart';
import 'package:terminal_library/xterm_library/core/core/platform.dart';
import 'package:terminal_library/xterm_library/core/core/state.dart';

class TerminalLibraryFlutterMouseEvent {
  /// The button that is pressed or released.
  final TerminalLibraryFlutterMouseButton button;

  /// The current state of the button.
  final TerminalLibraryFlutterMouseButtonState buttonState;

  /// The position of button state change.
  final CellOffset position;

  /// The state of the terminal.
  final TerminalLibraryFlutterState state;

  /// The platform of the terminal.
  final TerminalLibraryFlutterTargetPlatform platform;

  TerminalLibraryFlutterMouseEvent({
    required this.button,
    required this.buttonState,
    required this.position,
    required this.state,
    required this.platform,
  });
}

const defaultMouseHandler = CascadeMouseHandler([
  ClickMouseHandler(),
  UpDownMouseHandler(),
]);

abstract class TerminalLibraryFlutterMouseHandler {
  const TerminalLibraryFlutterMouseHandler();

  String? call(TerminalLibraryFlutterMouseEvent event);
}

class CascadeMouseHandler implements TerminalLibraryFlutterMouseHandler {
  final List<TerminalLibraryFlutterMouseHandler> _handlers;

  const CascadeMouseHandler(this._handlers);

  @override
  String? call(TerminalLibraryFlutterMouseEvent event) {
    for (var handler in _handlers) {
      final result = handler(event);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

class ClickMouseHandler implements TerminalLibraryFlutterMouseHandler {
  const ClickMouseHandler();

  @override
  String? call(TerminalLibraryFlutterMouseEvent event) {
    switch (event.state.mouseMode) {
      case MouseMode.clickOnly:
        // Only clicks and only the first 3 buttons are reported.
        if (event.buttonState == TerminalLibraryFlutterMouseButtonState.down &&
            (event.button.id < 3)) {
          return MouseReporter.report(
            event.button,
            event.buttonState,
            event.position,
            event.state.mouseReportMode,
          );
        }
        return null;
      case MouseMode.none:
      case MouseMode.upDownScroll:
      case MouseMode.upDownScrollDrag:
      case MouseMode.upDownScrollMove:
        return null;
    }
  }
}

class UpDownMouseHandler implements TerminalLibraryFlutterMouseHandler {
  const UpDownMouseHandler();

  @override
  String? call(TerminalLibraryFlutterMouseEvent event) {
    switch (event.state.mouseMode) {
      case MouseMode.none:
      case MouseMode.clickOnly:
        return null;
      case MouseMode.upDownScroll:
      case MouseMode.upDownScrollDrag:
      case MouseMode.upDownScrollMove:
        // Up events are never reported for mouse wheel buttons.
        if (event.button.isWheel &&
            event.buttonState == TerminalLibraryFlutterMouseButtonState.up) {
          return null;
        }
        return MouseReporter.report(
          event.button,
          event.buttonState,
          event.position,
          event.state.mouseReportMode,
        );
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:terminal_library/xterm_library/core.dart';
import 'package:terminal_library/xterm_library/core/ui/infinite_scroll_view.dart';

/// Handles scrolling gestures in the alternate screen buffer. In alternate
/// screen buffer, the terminal don't have a scrollback buffer, instead, the
/// scroll gestures are converted to escape sequences based on the current
/// report mode declared by the application.
class TerminalLibraryFlutterScrollGestureHandler extends StatefulWidget {
  const TerminalLibraryFlutterScrollGestureHandler({
    super.key,
    required this.terminal,
    required this.getCellOffset,
    required this.getLineHeight,
    this.simulateScroll = true,
    required this.child,
  });

  final TerminalLibraryFlutter terminal;

  /// Returns the cell offset for the pixel offset.
  final CellOffset Function(Offset) getCellOffset;

  /// Returns the pixel height of lines in the terminal.
  final double Function() getLineHeight;

  /// Whether to simulate scroll events in the terminal when the application
  /// doesn't declare it supports mouse wheel events. true by default as it
  /// is the default behavior of most terminals.
  final bool simulateScroll;

  final Widget child;

  @override
  State<TerminalLibraryFlutterScrollGestureHandler> createState() => _TerminalLibraryFlutterScrollGestureHandlerState();
}

class _TerminalLibraryFlutterScrollGestureHandlerState extends State<TerminalLibraryFlutterScrollGestureHandler> {
  /// Whether the application is in alternate screen buffer. If false, then this
  /// widget does nothing.
  var isAltBuffer = false;

  /// The variable that tracks the line offset in last scroll event. Used to
  /// determine how many the scroll events should be sent to the terminal.
  var lastLineOffset = 0;

  /// This variable tracks the last offset where the scroll gesture started.
  /// Used to calculate the cell offset of the terminal mouse event.
  var lastPointerPosition = Offset.zero;

  @override
  void initState() {
    widget.terminal.addListener(_onTerminalLibraryFlutterUpdated);
    isAltBuffer = widget.terminal.isUsingAltBuffer;
    super.initState();
  }

  @override
  void dispose() {
    widget.terminal.removeListener(_onTerminalLibraryFlutterUpdated);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TerminalLibraryFlutterScrollGestureHandler oldWidget) {
    if (oldWidget.terminal != widget.terminal) {
      oldWidget.terminal.removeListener(_onTerminalLibraryFlutterUpdated);
      widget.terminal.addListener(_onTerminalLibraryFlutterUpdated);
      isAltBuffer = widget.terminal.isUsingAltBuffer;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onTerminalLibraryFlutterUpdated() {
    if (isAltBuffer != widget.terminal.isUsingAltBuffer) {
      isAltBuffer = widget.terminal.isUsingAltBuffer;
      setState(() {});
    }
  }

  /// Send a single scroll event to the terminal. If [simulateScroll] is true,
  /// then if the application doesn't recognize mouse wheel events, this method
  /// will simulate scroll events by sending up/down arrow keys.
  void _sendScrollEvent(bool up) {
    final position = widget.getCellOffset(lastPointerPosition);

    final handled = widget.terminal.mouseInput(
      up ? TerminalLibraryFlutterMouseButton.wheelUp : TerminalLibraryFlutterMouseButton.wheelDown,
      TerminalLibraryFlutterMouseButtonState.down,
      position,
    );

    if (!handled && widget.simulateScroll) {
      widget.terminal.keyInput(
        up ? TerminalLibraryFlutterKey.arrowUp : TerminalLibraryFlutterKey.arrowDown,
      );
    }
  }

  void _onScroll(double offset) {
    final currentLineOffset = offset ~/ widget.getLineHeight();

    final delta = currentLineOffset - lastLineOffset;

    for (var i = 0; i < delta.abs(); i++) {
      _sendScrollEvent(delta < 0);
    }

    lastLineOffset = currentLineOffset;
  }

  @override
  Widget build(BuildContext context) {
    if (!isAltBuffer) {
      return widget.child;
    }

    return Listener(
      onPointerSignal: (event) {
        lastPointerPosition = event.position;
      },
      onPointerDown: (event) {
        lastPointerPosition = event.position;
      },
      child: InfiniteScrollView(
        onScroll: _onScroll,
        child: widget.child,
      ),
    );
  }
}

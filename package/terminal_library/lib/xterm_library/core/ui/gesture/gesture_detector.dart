import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// UncompleteDocumentation

class TerminalLibraryFlutterGestureDetector extends StatefulWidget {
  /// UncompleteDocumentation

  const TerminalLibraryFlutterGestureDetector({
    super.key,
    this.child,
    this.onSingleTapUp,
    this.onTapUp,
    this.onTapDown,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onDragStart,
    this.onDragUpdate,
    this.onDoubleTapDown,
  });

  /// UncompleteDocumentation

  final Widget? child;

  /// UncompleteDocumentation

  final GestureTapUpCallback? onTapUp;

  /// UncompleteDocumentation

  final GestureTapUpCallback? onSingleTapUp;

  /// UncompleteDocumentation

  final GestureTapDownCallback? onTapDown;

  /// UncompleteDocumentation

  final GestureTapDownCallback? onSecondaryTapDown;

  /// UncompleteDocumentation
  final GestureTapUpCallback? onSecondaryTapUp;

  /// UncompleteDocumentation
  final GestureTapDownCallback? onDoubleTapDown;

  /// UncompleteDocumentation
  final GestureTapDownCallback? onTertiaryTapDown;

  /// UncompleteDocumentation
  final GestureTapUpCallback? onTertiaryTapUp;

  /// UncompleteDocumentation
  final GestureLongPressStartCallback? onLongPressStart;

  /// UncompleteDocumentation
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// UncompleteDocumentation
  final GestureLongPressUpCallback? onLongPressUp;

  /// UncompleteDocumentation
  final GestureDragStartCallback? onDragStart;

  /// UncompleteDocumentation
  final GestureDragUpdateCallback? onDragUpdate;

  @override
  State<TerminalLibraryFlutterGestureDetector> createState() =>
      _TerminalLibraryFlutterGestureDetectorState();
}

class _TerminalLibraryFlutterGestureDetectorState
    extends State<TerminalLibraryFlutterGestureDetector> {
  Timer? _doubleTapTimer;

  Offset? _lastTapOffset;

  // True if a second tap down of a double tap is detected. Used to discard
  // subsequent tap up / tap hold of the same tap.
  bool _isDoubleTap = false;

  // The down handler is force-run on success of a single tap and optimistically
  // run before a long press success.
  void _handleTapDown(TapDownDetails details) {
    widget.onTapDown?.call(details);

    if (_doubleTapTimer != null &&
        _isWithinDoubleTapTolerance(details.globalPosition)) {
      // If there was already a previous tap, the second down hold/tap is a
      // double tap down.
      widget.onDoubleTapDown?.call(details);

      _doubleTapTimer!.cancel();
      _doubleTapTimeout();
      _isDoubleTap = true;
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!_isDoubleTap) {
      widget.onSingleTapUp?.call(details);
      _lastTapOffset = details.globalPosition;
      _doubleTapTimer = Timer(kDoubleTapTimeout, _doubleTapTimeout);
    }
    _isDoubleTap = false;
  }

  void _doubleTapTimeout() {
    _doubleTapTimer = null;
    _lastTapOffset = null;
  }

  bool _isWithinDoubleTapTolerance(Offset secondTapOffset) {
    if (_lastTapOffset == null) {
      return false;
    }

    final Offset difference = secondTapOffset - _lastTapOffset!;
    return difference.distance <= kDoubleTapSlop;
  }

  @override
  Widget build(BuildContext context) {
    final gestures = <Type, GestureRecognizerFactory>{};

    gestures[TapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
      () => TapGestureRecognizer(debugOwner: this),
      (TapGestureRecognizer instance) {
        instance
          ..onTapDown = _handleTapDown
          ..onTapUp = _handleTapUp
          ..onSecondaryTapDown = widget.onSecondaryTapDown
          ..onSecondaryTapUp = widget.onSecondaryTapUp
          ..onTertiaryTapDown = widget.onTertiaryTapDown
          ..onTertiaryTapUp = widget.onTertiaryTapUp;
      },
    );

    gestures[LongPressGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
      () => LongPressGestureRecognizer(
        debugOwner: this,
        supportedDevices: {
          PointerDeviceKind.touch,
          // PointerDeviceKind.mouse, // for debugging purposes only
        },
      ),
      (LongPressGestureRecognizer instance) {
        instance
          ..onLongPressStart = widget.onLongPressStart
          ..onLongPressMoveUpdate = widget.onLongPressMoveUpdate
          ..onLongPressUp = widget.onLongPressUp;
      },
    );

    gestures[PanGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
      () => PanGestureRecognizer(
        debugOwner: this,
        supportedDevices: <PointerDeviceKind>{PointerDeviceKind.mouse},
      ),
      (PanGestureRecognizer instance) {
        instance
          ..dragStartBehavior = DragStartBehavior.down
          ..onStart = widget.onDragStart
          ..onUpdate = widget.onDragUpdate;
      },
    );

    return RawGestureDetector(
      gestures: gestures,
      excludeFromSemantics: true,
      child: widget.child,
    );
  }
}

import 'package:terminal_library/xterm_library/core/core/input/keys.dart';
import 'package:terminal_library/xterm_library/core/core/input/keytab/keytab.dart';
import 'package:terminal_library/xterm_library/core/core/state.dart';
import 'package:terminal_library/xterm_library/core/core/platform.dart';

/// The key event received from the keyboard, along with the state of the
/// modifier keys and state of the terminal. Typically consumed by the
/// [TerminalLibraryFlutterInputHandler] to produce a escape sequence that can be recognized
/// by the terminal.
///
/// See also:
/// - [TerminalLibraryFlutterInputHandler]
class TerminalLibraryFlutterKeyboardEvent {
  /// UncompleteDocumentation
  final TerminalLibraryFlutterKey key;

  /// UncompleteDocumentation
  final bool shift;

  /// UncompleteDocumentation
  final bool ctrl;

  /// UncompleteDocumentation
  final bool alt;

  /// UncompleteDocumentation
  final TerminalLibraryFlutterState state;

  /// UncompleteDocumentation
  final bool altBuffer;

  /// UncompleteDocumentation
  final TerminalLibraryFlutterTargetPlatform platform;

  /// UncompleteDocumentation
  TerminalLibraryFlutterKeyboardEvent({
    required this.key,
    required this.shift,
    required this.ctrl,
    required this.alt,
    required this.state,
    required this.altBuffer,
    required this.platform,
  });

  /// UncompleteDocumentation

  TerminalLibraryFlutterKeyboardEvent copyWith({
    TerminalLibraryFlutterKey? key,
    bool? shift,
    bool? ctrl,
    bool? alt,
    TerminalLibraryFlutterState? state,
    bool? altBuffer,
    TerminalLibraryFlutterTargetPlatform? platform,
  }) {
    return TerminalLibraryFlutterKeyboardEvent(
      key: key ?? this.key,
      shift: shift ?? this.shift,
      ctrl: ctrl ?? this.ctrl,
      alt: alt ?? this.alt,
      state: state ?? this.state,
      altBuffer: altBuffer ?? this.altBuffer,
      platform: platform ?? this.platform,
    );
  }
}

/// TerminalLibraryFlutterInputHandler contains the logic for translating a [TerminalLibraryFlutterKeyboardEvent]
/// into escape sequences that can be recognized by the terminal.
abstract class TerminalLibraryFlutterInputHandler {
  /// Translates a [TerminalLibraryFlutterKeyboardEvent] into an escape sequence. If the event
  /// cannot be translated, null is returned.
  String? call(TerminalLibraryFlutterKeyboardEvent event);
}

/// A [TerminalLibraryFlutterInputHandler] that chains multiple handlers together. If any
/// handler returns a non-null value, it is returned. Otherwise, null is
/// returned.
class CascadeInputHandler implements TerminalLibraryFlutterInputHandler {
  final List<TerminalLibraryFlutterInputHandler> _handlers;

  /// UncompleteDocumentation
  const CascadeInputHandler(this._handlers);

  @override
  String? call(TerminalLibraryFlutterKeyboardEvent event) {
    for (var handler in _handlers) {
      final result = handler(event);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

/// The default input handler for the terminal. That is composed of a
/// [KeytabInputHandler], a [CtrlInputHandler], and a [AltInputHandler].
///
/// It's possible to override the default input handler behavior by chaining
/// another input handler before or after the default input handler using
/// [CascadeInputHandler].
///
/// See also:
///  * [CascadeInputHandler]
const defaultInputHandler = CascadeInputHandler([
  KeytabInputHandler(),
  CtrlInputHandler(),
  AltInputHandler(),
]);

/// A [TerminalLibraryFlutterInputHandler] that translates key events according to a keytab
/// file. If no keytab is provided, [Keytab.defaultKeytab] is used.
class KeytabInputHandler implements TerminalLibraryFlutterInputHandler {
  /// UncompleteDocumentation
  const KeytabInputHandler([this.keytab]);

  /// UncompleteDocumentation

  final Keytab? keytab;

  @override
  String? call(TerminalLibraryFlutterKeyboardEvent event) {
    final keytab = this.keytab ?? Keytab.defaultKeytab;

    final record = keytab.find(
      event.key,
      ctrl: event.ctrl,
      alt: event.alt,
      shift: event.shift,
      newLineMode: event.state.lineFeedMode,
      appCursorKeys: event.state.appKeypadMode,
      appKeyPad: event.state.appKeypadMode,
      appScreen: event.altBuffer,
      macos: event.platform == TerminalLibraryFlutterTargetPlatform.macos,
    );

    if (record == null) {
      return null;
    }

    var result = record.action.unescapedValue();
    result = insertModifiers(event, result);
    return result;
  }

  /// UncompleteDocumentation
  String insertModifiers(
      TerminalLibraryFlutterKeyboardEvent event, String action) {
    String? code;

    if (event.shift && event.alt && event.ctrl) {
      code = '8';
    } else if (event.ctrl && event.alt) {
      code = '7';
    } else if (event.shift && event.ctrl) {
      code = '6';
    } else if (event.ctrl) {
      code = '5';
    } else if (event.shift && event.alt) {
      code = '4';
    } else if (event.alt) {
      code = '3';
    } else if (event.shift) {
      code = '2';
    }

    if (code != null) {
      return action.replaceAll('*', code);
    }

    return action;
  }
}

/// A [TerminalLibraryFlutterInputHandler] that translates ctrl + key events into escape
/// sequences. For example, ctrl + a becomes ^A.
class CtrlInputHandler implements TerminalLibraryFlutterInputHandler {
  /// UncompleteDocumentation
  const CtrlInputHandler();

  @override
  String? call(TerminalLibraryFlutterKeyboardEvent event) {
    if (!event.ctrl || event.shift || event.alt) {
      return null;
    }

    final key = event.key;

    if (key.index >= TerminalLibraryFlutterKey.keyA.index &&
        key.index <= TerminalLibraryFlutterKey.keyZ.index) {
      final input = key.index - TerminalLibraryFlutterKey.keyA.index + 1;
      return String.fromCharCode(input);
    }

    return null;
  }
}

/// A [TerminalLibraryFlutterInputHandler] that translates alt + key events into escape
/// sequences. For example, alt + a becomes ^[a.
/// UncompleteDocumentation
class AltInputHandler implements TerminalLibraryFlutterInputHandler {
  /// UncompleteDocumentation
  const AltInputHandler();

  @override
  String? call(TerminalLibraryFlutterKeyboardEvent event) {
    if (!event.alt || event.ctrl || event.shift) {
      return null;
    }

    if (event.platform == TerminalLibraryFlutterTargetPlatform.macos) {
      return null;
    }

    final key = event.key;

    if (key.index >= TerminalLibraryFlutterKey.keyA.index &&
        key.index <= TerminalLibraryFlutterKey.keyZ.index) {
      final charCode = key.index - TerminalLibraryFlutterKey.keyA.index + 65;
      final input = [0x1b, charCode];
      return String.fromCharCodes(input);
    }

    return null;
  }
}

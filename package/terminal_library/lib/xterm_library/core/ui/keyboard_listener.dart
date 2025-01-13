import 'package:flutter/widgets.dart';

/// UncompleteDocumentation
class CustomKeyboardListener extends StatelessWidget {
  /// UncompleteDocumentation
  final Widget child;

  /// UncompleteDocumentation
  final FocusNode focusNode;

  /// UncompleteDocumentation
  final bool autofocus;

  /// UncompleteDocumentation
  final void Function(String) onInsert;

  /// UncompleteDocumentation
  final void Function(String?) onComposing;

  /// UncompleteDocumentation
  final KeyEventResult Function(FocusNode, KeyEvent) onKeyEvent;

  /// UncompleteDocumentation
  const CustomKeyboardListener({
    super.key,
    required this.child,
    required this.focusNode,
    this.autofocus = false,
    required this.onInsert,
    required this.onComposing,
    required this.onKeyEvent,
  });

  KeyEventResult _onKeyEvent(FocusNode focusNode, KeyEvent keyEvent) {
    // First try to handle the key event directly.
    final handled = onKeyEvent(focusNode, keyEvent);
    if (handled == KeyEventResult.ignored) {
      // If it was not handled, but the key corresponds to a character,
      // insert the character.
      if (keyEvent.character != null && keyEvent.character != "") {
        onInsert(keyEvent.character!);
        return KeyEventResult.handled;
      }
    }
    return handled;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      onKeyEvent: _onKeyEvent,
      child: child,
    );
  }
}

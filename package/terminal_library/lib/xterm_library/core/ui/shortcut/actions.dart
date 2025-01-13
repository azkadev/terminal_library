import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:terminal_library/xterm_library/core/terminal.dart';
import 'package:terminal_library/xterm_library/core/ui/controller.dart';
import 'package:terminal_library/xterm_library/core/ui/selection_mode.dart';

/// UncompleteDocumentation
class TerminalLibraryFlutterActions extends StatelessWidget {
  /// UncompleteDocumentation
  const TerminalLibraryFlutterActions({
    super.key,
    required this.terminal,
    required this.controller,
    required this.child,
  });

  /// UncompleteDocumentation
  final TerminalLibraryFlutter terminal;

  /// UncompleteDocumentation
  final TerminalLibraryFlutterController controller;

  /// UncompleteDocumentation
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: {
        PasteTextIntent: CallbackAction<PasteTextIntent>(
          onInvoke: (intent) async {
            final data = await Clipboard.getData(Clipboard.kTextPlain);
            final text = data?.text;
            if (text != null) {
              terminal.paste(text);
              controller.clearSelection();
            }
            return null;
          },
        ),
        CopySelectionTextIntent: CallbackAction<CopySelectionTextIntent>(
          onInvoke: (intent) async {
            final selection = controller.selection;

            if (selection == null) {
              return;
            }

            final text = terminal.buffer.getText(selection);

            await Clipboard.setData(ClipboardData(text: text));

            return null;
          },
        ),
        SelectAllTextIntent: CallbackAction<SelectAllTextIntent>(
          onInvoke: (intent) {
            controller.setSelection(
              terminal.buffer.createAnchor(
                0,
                terminal.buffer.height - terminal.viewHeight,
              ),
              terminal.buffer.createAnchor(
                terminal.viewWidth,
                terminal.buffer.height - 1,
              ),
              mode: SelectionMode.line,
            );
            return null;
          },
        ),
      },
      child: child,
    );
  }
}

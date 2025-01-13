/// UncompleteDocumentation
enum PointerInput {
  /// Taps / buttons presses & releases.
  tap,

  /// Scroll / mouse wheels events.
  scroll,

  /// Drag events, a pointer is in a down state and dragged across the terminal.
  drag,

  /// Move events, a pointer is in an up state and moved across the terminal.
  move,
}

/// UncompleteDocumentation
class PointerInputs {
  /// UncompleteDocumentation
  final Set<PointerInput> inputs;

  /// UncompleteDocumentation
  const PointerInputs(this.inputs);

  /// UncompleteDocumentation
  const PointerInputs.none() : inputs = const <PointerInput>{};

  /// UncompleteDocumentation
  const PointerInputs.all()
      : inputs = const <PointerInput>{
          PointerInput.tap,
          PointerInput.scroll,
          PointerInput.drag,
          PointerInput.move,
        };
}

/// UncompleteDocumentation
enum TerminalLibraryFlutterMouseButton {
  /// UncompleteDocumentation
  left(id: 0),

  /// UncompleteDocumentation
  middle(id: 1),

  /// UncompleteDocumentation
  right(id: 2),

  /// UncompleteDocumentation
  wheelUp(id: 64 + 4, isWheel: true),

  /// UncompleteDocumentation
  wheelDown(id: 64 + 5, isWheel: true),

  /// UncompleteDocumentation
  wheelLeft(id: 64 + 6, isWheel: true),

  /// UncompleteDocumentation
  wheelRight(id: 64 + 7, isWheel: true);

  /// The id that is used to report a button press or release to the terminal.
  ///
  /// Mouse wheel up / down use button IDs 4 = 0100 (binary) and 5 = 0101 (binary).
  /// The bits three and four of the button are transposed by 64 and 128
  /// respectively, when reporting the id of the button and have have to be
  /// adjusted correspondingly.
  final int id;

  /// Whether this button is a mouse wheel button.
  final bool isWheel;

  const TerminalLibraryFlutterMouseButton(
      {required this.id, this.isWheel = false});
}

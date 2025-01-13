/// UncompleteDocumentation
class TerminalLibraryFlutterSize {
  /// UncompleteDocumentation
  final int width;

  /// UncompleteDocumentation

  final int height;

  /// UncompleteDocumentation

  const TerminalLibraryFlutterSize(this.width, this.height);

  @override
  String toString() => 'TerminalLibraryFlutterSize($width, $height)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! TerminalLibraryFlutterSize) {
      return false;
    }
    return other.width == width && other.height == height;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode;
}

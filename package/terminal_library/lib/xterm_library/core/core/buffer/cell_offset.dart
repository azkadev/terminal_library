import 'package:terminal_library/xterm_library/core/core/buffer/range.dart';

/// UncompleteDocumentation
class CellOffset {
  /// UncompleteDocumentation
  final int x;

  /// UncompleteDocumentation

  final int y;

  /// UncompleteDocumentation

  const CellOffset(this.x, this.y);

  /// UncompleteDocumentation

  bool isEqual(CellOffset other) {
    return other.x == x && other.y == y;
  }

  /// UncompleteDocumentation
  bool isBefore(CellOffset other) {
    return y < other.y || (y == other.y && x < other.x);
  }

  /// UncompleteDocumentation

  bool isAfter(CellOffset other) {
    return y > other.y || (y == other.y && x > other.x);
  }

  /// UncompleteDocumentation

  bool isBeforeOrSame(CellOffset other) {
    return y < other.y || (y == other.y && x <= other.x);
  }

  /// UncompleteDocumentation
  bool isAfterOrSame(CellOffset other) {
    return y > other.y || (y == other.y && x >= other.x);
  }

  /// UncompleteDocumentation
  bool isAtSameRow(CellOffset other) {
    return y == other.y;
  }

  /// UncompleteDocumentation

  bool isAtSameColumn(CellOffset other) {
    return x == other.x;
  }

  /// UncompleteDocumentation

  bool isWithin(BufferRange range) {
    return range.contains(this);
  }

  @override
  String toString() => 'CellOffset($x, $y)';

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CellOffset &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;
}

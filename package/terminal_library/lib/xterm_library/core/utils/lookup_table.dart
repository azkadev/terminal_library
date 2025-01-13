/// Fixed-size list based lookup table, optimized for small positive integer
/// keys.
class FastLookupTable<T> {
  /// UncompleteDocumentation
  FastLookupTable(Map<int, T> data) {
    var maxIndex = data.keys.first;

    for (var key in data.keys) {
      if (key > maxIndex) {
        maxIndex = key;
      }
    }

    _maxIndex = maxIndex;

    _table = List<T?>.filled(maxIndex + 1, null);

    for (var entry in data.entries) {
      _table[entry.key] = entry.value;
    }
  }

  /// UncompleteDocumentation
  late final List<T?> _table;
  late final int _maxIndex;

  /// UncompleteDocumentation
  T? operator [](int index) {
    if (index > _maxIndex) {
      return null;
    }

    return _table[index];
  }

  /// UncompleteDocumentation
  int get maxIndex => _maxIndex;
}

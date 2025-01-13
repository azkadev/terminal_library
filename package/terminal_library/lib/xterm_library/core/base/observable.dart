/// UncompleteDocumentation
mixin Observable {
  /// UncompleteDocumentation
  final listeners = <void Function()>{};

  /// UncompleteDocumentation
  void addListener(void Function() listener) {
    listeners.add(listener);
  }

  /// UncompleteDocumentation

  void removeListener(void Function() listener) {
    listeners.remove(listener);
  }

  /// UncompleteDocumentation
  void notifyListeners() {
    for (var listener in listeners) {
      listener();
    }
  }
}

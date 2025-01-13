import 'package:terminal_library/xterm_library/core/base/event.dart';

/// UncompleteDocumentation
mixin Disposable {
  final _disposables = <Disposable>[];

  /// UncompleteDocumentation
  bool get disposed => _disposed;
  bool _disposed = false;

  /// UncompleteDocumentation
  Event get onDisposed => _onDisposed.event;
  final _onDisposed = EventEmitter();

  /// UncompleteDocumentation
  void register(Disposable disposable) {
    assert(!_disposed);
    _disposables.add(disposable);
  }

  /// UncompleteDocumentation
  void registerCallback(void Function() callback) {
    assert(!_disposed);
    _disposables.add(_DisposeCallback(callback));
  }

  /// UncompleteDocumentation

  void dispose() {
    _disposed = true;
    for (final disposable in _disposables) {
      disposable.dispose();
    }
    _onDisposed.emit(null);
  }
}

class _DisposeCallback with Disposable {
  final void Function() callback;

  _DisposeCallback(this.callback);

  @override
  void dispose() {
    super.dispose();
    callback();
  }
}

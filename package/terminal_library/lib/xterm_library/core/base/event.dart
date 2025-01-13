import 'package:terminal_library/xterm_library/core/base/disposable.dart';

/// UncompleteDocumentation
typedef EventListener<T> = void Function(T event);

/// UncompleteDocumentation
class Event<T> {
  /// UncompleteDocumentation
  final EventEmitter<T> emitter;

  /// UncompleteDocumentation
  Event(this.emitter);

  /// UncompleteDocumentation
  void call(EventListener<T> listener) {
    emitter(listener);
  }
}

/// UncompleteDocumentation
class EventEmitter<T> {
  final _listeners = <EventListener<T>>[];

  /// UncompleteDocumentation
  EventSubscription<T> call(EventListener<T> listener) {
    _listeners.add(listener);
    return EventSubscription(this, listener);
  }

  /// UncompleteDocumentation

  void emit(T event) {
    for (final listener in _listeners) {
      listener(event);
    }
  }

  /// UncompleteDocumentation
  Event<T> get event => Event(this);
}

/// UncompleteDocumentation
class EventSubscription<T> with Disposable {
  /// UncompleteDocumentation
  final EventEmitter<T> emitter;

  /// UncompleteDocumentation
  final EventListener<T> listener;

  /// UncompleteDocumentation

  EventSubscription(this.emitter, this.listener);

  @override
  void dispose() {
    emitter._listeners.remove(listener);
  }
}

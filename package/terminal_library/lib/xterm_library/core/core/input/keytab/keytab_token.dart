import 'dart:math' show min;

/// UncompleteDocumentation
enum KeytabTokenType {
  /// UncompleteDocumentation
  keyDefine,

  /// UncompleteDocumentation
  keyboard,

  /// UncompleteDocumentation
  keyName,

  /// UncompleteDocumentation
  mode,

  /// UncompleteDocumentation
  modeStatus,

  /// UncompleteDocumentation
  colon,

  /// UncompleteDocumentation
  input,

  /// UncompleteDocumentation
  shortcut;
}

/// UncompleteDocumentation
class KeytabToken {
  /// UncompleteDocumentation
  KeytabToken(this.type, this.value);

  /// UncompleteDocumentation
  final KeytabTokenType type;

  /// UncompleteDocumentation
  final String value;

  @override
  String toString() {
    return '$type<$value>';
  }
}

/// UncompleteDocumentation
class LineReader {
  /// UncompleteDocumentation
  LineReader(this.line);

  /// UncompleteDocumentation
  final String line;

  var _pos = 0;

  /// UncompleteDocumentation
  bool get done => _pos > line.length - 1;

  /// UncompleteDocumentation
  String? take([int count = 1]) {
    final result = peek(count);
    _pos += count;
    return result;
  }

  /// UncompleteDocumentation
  String? peek([int count = 1]) {
    if (done) return null;
    final end = min(_pos + count, line.length);
    final result = line.substring(_pos, end);
    return result;
  }

  /// UncompleteDocumentation
  void skipWhitespace() {
    while (peek() == ' ' || peek() == '\t') {
      _pos += 1;
    }
  }

  /// UncompleteDocumentation
  String readString() {
    final buffer = StringBuffer();
    final pattern = RegExp(r'\w|_');

    while (!done && line[_pos].contains(pattern)) {
      buffer.write(line[_pos]);
      _pos++;
    }

    return buffer.toString();
  }

  /// UncompleteDocumentation
  String readUntil(Pattern pattern, {bool inclusive = false}) {
    final buffer = StringBuffer();

    while (!done && !line[_pos].contains(pattern)) {
      buffer.write(line[_pos]);
      _pos++;
    }

    if (!done && inclusive) {
      buffer.write(line[_pos]);
      _pos++;
    }

    return buffer.toString();
  }
}

/// UncompleteDocumentation

class TokenizeError {}

/// UncompleteDocumentation
Iterable<KeytabToken> tokenize(String source) sync* {
  final lines = source.split('\n');

  for (var i = 0; i < lines.length; i++) {
    var line = lines[i].trim();
    line = line.replaceFirst(RegExp('#.*'), '');

    if (line == '') {
      continue;
    }

    if (_isKeyboardNameDefine(line)) {
      yield* _parseKeyboardNameDefine(line);
    }

    if (_isKeyDefine(line)) {
      yield* _parseKeyDefine(line);
    }
  }
}

bool _isKeyboardNameDefine(String line) {
  return line.startsWith('keyboard ');
}

bool _isKeyDefine(String line) {
  return line.startsWith('key ');
}

Iterable<KeytabToken> _parseKeyboardNameDefine(String line) sync* {
  final reader = LineReader(line.trim());

  if (reader.readString() == 'keyboard') {
    yield KeytabToken(KeytabTokenType.keyboard, 'keyboard');
  } else {
    throw TokenizeError();
  }

  reader.skipWhitespace();

  yield _readInput(reader);
}

Iterable<KeytabToken> _parseKeyDefine(String line) sync* {
  final reader = LineReader(line.trim());

  if (reader.readString() == 'key') {
    yield KeytabToken(KeytabTokenType.keyDefine, 'key');
  } else {
    throw TokenizeError();
  }

  reader.skipWhitespace();

  final keyName = reader.readString();
  yield KeytabToken(KeytabTokenType.keyName, keyName);

  reader.skipWhitespace();

  while (reader.peek() == '+' || reader.peek() == '-') {
    final modeStatus = reader.take()!;
    yield KeytabToken(KeytabTokenType.modeStatus, modeStatus);
    final mode = reader.readString();
    yield KeytabToken(KeytabTokenType.mode, mode);
    reader.skipWhitespace();
  }

  if (reader.take() == ':') {
    yield KeytabToken(KeytabTokenType.colon, ':');
  } else {
    throw TokenizeError();
  }

  reader.skipWhitespace();

  if (reader.peek() == '"') {
    yield _readInput(reader);
  } else {
    final action = reader.readString();
    yield KeytabToken(KeytabTokenType.shortcut, action);
  }
}

KeytabToken _readInput(LineReader reader) {
  reader.skipWhitespace();

  if (reader.take() != '"') {
    throw TokenizeError();
  }

  final value = reader.readUntil('"');
  reader.take();

  return KeytabToken(KeytabTokenType.input, value);
}

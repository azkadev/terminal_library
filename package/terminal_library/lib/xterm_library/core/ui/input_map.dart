import 'package:flutter/services.dart';
import 'package:terminal_library/xterm_library/core/core/input/keys.dart';

final _keyToTerminalLibraryFlutterKey = {
  LogicalKeyboardKey.hyper: TerminalLibraryFlutterKey.hyper,
  LogicalKeyboardKey.superKey: TerminalLibraryFlutterKey.superKey,
  LogicalKeyboardKey.fnLock: TerminalLibraryFlutterKey.fnLock,
  LogicalKeyboardKey.suspend: TerminalLibraryFlutterKey.suspend,
  LogicalKeyboardKey.resume: TerminalLibraryFlutterKey.resume,
  LogicalKeyboardKey.sleep: TerminalLibraryFlutterKey.sleep,
  LogicalKeyboardKey.wakeUp: TerminalLibraryFlutterKey.wakeUp,
  LogicalKeyboardKey.keyA: TerminalLibraryFlutterKey.keyA,
  LogicalKeyboardKey.keyB: TerminalLibraryFlutterKey.keyB,
  LogicalKeyboardKey.keyC: TerminalLibraryFlutterKey.keyC,
  LogicalKeyboardKey.keyD: TerminalLibraryFlutterKey.keyD,
  LogicalKeyboardKey.keyE: TerminalLibraryFlutterKey.keyE,
  LogicalKeyboardKey.keyF: TerminalLibraryFlutterKey.keyF,
  LogicalKeyboardKey.keyG: TerminalLibraryFlutterKey.keyG,
  LogicalKeyboardKey.keyH: TerminalLibraryFlutterKey.keyH,
  LogicalKeyboardKey.keyI: TerminalLibraryFlutterKey.keyI,
  LogicalKeyboardKey.keyJ: TerminalLibraryFlutterKey.keyJ,
  LogicalKeyboardKey.keyK: TerminalLibraryFlutterKey.keyK,
  LogicalKeyboardKey.keyL: TerminalLibraryFlutterKey.keyL,
  LogicalKeyboardKey.keyM: TerminalLibraryFlutterKey.keyM,
  LogicalKeyboardKey.keyN: TerminalLibraryFlutterKey.keyN,
  LogicalKeyboardKey.keyO: TerminalLibraryFlutterKey.keyO,
  LogicalKeyboardKey.keyP: TerminalLibraryFlutterKey.keyP,
  LogicalKeyboardKey.keyQ: TerminalLibraryFlutterKey.keyQ,
  LogicalKeyboardKey.keyR: TerminalLibraryFlutterKey.keyR,
  LogicalKeyboardKey.keyS: TerminalLibraryFlutterKey.keyS,
  LogicalKeyboardKey.keyT: TerminalLibraryFlutterKey.keyT,
  LogicalKeyboardKey.keyU: TerminalLibraryFlutterKey.keyU,
  LogicalKeyboardKey.keyV: TerminalLibraryFlutterKey.keyV,
  LogicalKeyboardKey.keyW: TerminalLibraryFlutterKey.keyW,
  LogicalKeyboardKey.keyX: TerminalLibraryFlutterKey.keyX,
  LogicalKeyboardKey.keyY: TerminalLibraryFlutterKey.keyY,
  LogicalKeyboardKey.keyZ: TerminalLibraryFlutterKey.keyZ,
  LogicalKeyboardKey.digit1: TerminalLibraryFlutterKey.digit1,
  LogicalKeyboardKey.digit2: TerminalLibraryFlutterKey.digit2,
  LogicalKeyboardKey.digit3: TerminalLibraryFlutterKey.digit3,
  LogicalKeyboardKey.digit4: TerminalLibraryFlutterKey.digit4,
  LogicalKeyboardKey.digit5: TerminalLibraryFlutterKey.digit5,
  LogicalKeyboardKey.digit6: TerminalLibraryFlutterKey.digit6,
  LogicalKeyboardKey.digit7: TerminalLibraryFlutterKey.digit7,
  LogicalKeyboardKey.digit8: TerminalLibraryFlutterKey.digit8,
  LogicalKeyboardKey.digit9: TerminalLibraryFlutterKey.digit9,
  LogicalKeyboardKey.digit0: TerminalLibraryFlutterKey.digit0,
  LogicalKeyboardKey.enter: TerminalLibraryFlutterKey.enter,
  LogicalKeyboardKey.escape: TerminalLibraryFlutterKey.escape,
  LogicalKeyboardKey.backspace: TerminalLibraryFlutterKey.backspace,
  LogicalKeyboardKey.tab: TerminalLibraryFlutterKey.tab,
  LogicalKeyboardKey.space: TerminalLibraryFlutterKey.space,
  LogicalKeyboardKey.minus: TerminalLibraryFlutterKey.minus,
  LogicalKeyboardKey.equal: TerminalLibraryFlutterKey.equal,
  LogicalKeyboardKey.bracketLeft: TerminalLibraryFlutterKey.bracketLeft,
  LogicalKeyboardKey.bracketRight: TerminalLibraryFlutterKey.bracketRight,
  LogicalKeyboardKey.backslash: TerminalLibraryFlutterKey.backslash,
  LogicalKeyboardKey.semicolon: TerminalLibraryFlutterKey.semicolon,
  LogicalKeyboardKey.quote: TerminalLibraryFlutterKey.quote,
  LogicalKeyboardKey.backquote: TerminalLibraryFlutterKey.backquote,
  LogicalKeyboardKey.comma: TerminalLibraryFlutterKey.comma,
  LogicalKeyboardKey.period: TerminalLibraryFlutterKey.period,
  LogicalKeyboardKey.slash: TerminalLibraryFlutterKey.slash,
  LogicalKeyboardKey.capsLock: TerminalLibraryFlutterKey.capsLock,
  LogicalKeyboardKey.f1: TerminalLibraryFlutterKey.f1,
  LogicalKeyboardKey.f2: TerminalLibraryFlutterKey.f2,
  LogicalKeyboardKey.f3: TerminalLibraryFlutterKey.f3,
  LogicalKeyboardKey.f4: TerminalLibraryFlutterKey.f4,
  LogicalKeyboardKey.f5: TerminalLibraryFlutterKey.f5,
  LogicalKeyboardKey.f6: TerminalLibraryFlutterKey.f6,
  LogicalKeyboardKey.f7: TerminalLibraryFlutterKey.f7,
  LogicalKeyboardKey.f8: TerminalLibraryFlutterKey.f8,
  LogicalKeyboardKey.f9: TerminalLibraryFlutterKey.f9,
  LogicalKeyboardKey.f10: TerminalLibraryFlutterKey.f10,
  LogicalKeyboardKey.f11: TerminalLibraryFlutterKey.f11,
  LogicalKeyboardKey.f12: TerminalLibraryFlutterKey.f12,
  LogicalKeyboardKey.printScreen: TerminalLibraryFlutterKey.printScreen,
  LogicalKeyboardKey.scrollLock: TerminalLibraryFlutterKey.scrollLock,
  LogicalKeyboardKey.pause: TerminalLibraryFlutterKey.pause,
  LogicalKeyboardKey.insert: TerminalLibraryFlutterKey.insert,
  LogicalKeyboardKey.home: TerminalLibraryFlutterKey.home,
  LogicalKeyboardKey.pageUp: TerminalLibraryFlutterKey.pageUp,
  LogicalKeyboardKey.delete: TerminalLibraryFlutterKey.delete,
  LogicalKeyboardKey.end: TerminalLibraryFlutterKey.end,
  LogicalKeyboardKey.pageDown: TerminalLibraryFlutterKey.pageDown,
  LogicalKeyboardKey.arrowRight: TerminalLibraryFlutterKey.arrowRight,
  LogicalKeyboardKey.arrowLeft: TerminalLibraryFlutterKey.arrowLeft,
  LogicalKeyboardKey.arrowDown: TerminalLibraryFlutterKey.arrowDown,
  LogicalKeyboardKey.arrowUp: TerminalLibraryFlutterKey.arrowUp,
  LogicalKeyboardKey.numLock: TerminalLibraryFlutterKey.numLock,
  LogicalKeyboardKey.numpadDivide: TerminalLibraryFlutterKey.numpadDivide,
  LogicalKeyboardKey.numpadMultiply: TerminalLibraryFlutterKey.numpadMultiply,
  LogicalKeyboardKey.numpadSubtract: TerminalLibraryFlutterKey.numpadSubtract,
  LogicalKeyboardKey.numpadAdd: TerminalLibraryFlutterKey.numpadAdd,
  LogicalKeyboardKey.numpadEnter: TerminalLibraryFlutterKey.numpadEnter,
  LogicalKeyboardKey.numpad1: TerminalLibraryFlutterKey.numpad1,
  LogicalKeyboardKey.numpad2: TerminalLibraryFlutterKey.numpad2,
  LogicalKeyboardKey.numpad3: TerminalLibraryFlutterKey.numpad3,
  LogicalKeyboardKey.numpad4: TerminalLibraryFlutterKey.numpad4,
  LogicalKeyboardKey.numpad5: TerminalLibraryFlutterKey.numpad5,
  LogicalKeyboardKey.numpad6: TerminalLibraryFlutterKey.numpad6,
  LogicalKeyboardKey.numpad7: TerminalLibraryFlutterKey.numpad7,
  LogicalKeyboardKey.numpad8: TerminalLibraryFlutterKey.numpad8,
  LogicalKeyboardKey.numpad9: TerminalLibraryFlutterKey.numpad9,
  LogicalKeyboardKey.numpad0: TerminalLibraryFlutterKey.numpad0,
  LogicalKeyboardKey.numpadDecimal: TerminalLibraryFlutterKey.numpadDecimal,
  LogicalKeyboardKey.intlBackslash: TerminalLibraryFlutterKey.intlBackslash,
  LogicalKeyboardKey.contextMenu: TerminalLibraryFlutterKey.contextMenu,
  LogicalKeyboardKey.power: TerminalLibraryFlutterKey.power,
  LogicalKeyboardKey.numpadEqual: TerminalLibraryFlutterKey.numpadEqual,
  LogicalKeyboardKey.f13: TerminalLibraryFlutterKey.f13,
  LogicalKeyboardKey.f14: TerminalLibraryFlutterKey.f14,
  LogicalKeyboardKey.f15: TerminalLibraryFlutterKey.f15,
  LogicalKeyboardKey.f16: TerminalLibraryFlutterKey.f16,
  LogicalKeyboardKey.f17: TerminalLibraryFlutterKey.f17,
  LogicalKeyboardKey.f18: TerminalLibraryFlutterKey.f18,
  LogicalKeyboardKey.f19: TerminalLibraryFlutterKey.f19,
  LogicalKeyboardKey.f20: TerminalLibraryFlutterKey.f20,
  LogicalKeyboardKey.f21: TerminalLibraryFlutterKey.f21,
  LogicalKeyboardKey.f22: TerminalLibraryFlutterKey.f22,
  LogicalKeyboardKey.f23: TerminalLibraryFlutterKey.f23,
  LogicalKeyboardKey.f24: TerminalLibraryFlutterKey.f24,
  LogicalKeyboardKey.open: TerminalLibraryFlutterKey.open,
  LogicalKeyboardKey.help: TerminalLibraryFlutterKey.help,
  LogicalKeyboardKey.select: TerminalLibraryFlutterKey.select,
  LogicalKeyboardKey.again: TerminalLibraryFlutterKey.again,
  LogicalKeyboardKey.undo: TerminalLibraryFlutterKey.undo,
  LogicalKeyboardKey.cut: TerminalLibraryFlutterKey.cut,
  LogicalKeyboardKey.copy: TerminalLibraryFlutterKey.copy,
  LogicalKeyboardKey.paste: TerminalLibraryFlutterKey.paste,
  LogicalKeyboardKey.find: TerminalLibraryFlutterKey.find,
  LogicalKeyboardKey.audioVolumeMute: TerminalLibraryFlutterKey.audioVolumeMute,
  LogicalKeyboardKey.audioVolumeUp: TerminalLibraryFlutterKey.audioVolumeUp,
  LogicalKeyboardKey.audioVolumeDown: TerminalLibraryFlutterKey.audioVolumeDown,
  LogicalKeyboardKey.numpadComma: TerminalLibraryFlutterKey.numpadComma,
  LogicalKeyboardKey.intlRo: TerminalLibraryFlutterKey.intlRo,
  LogicalKeyboardKey.kanaMode: TerminalLibraryFlutterKey.kanaMode,
  LogicalKeyboardKey.intlYen: TerminalLibraryFlutterKey.intlYen,
  LogicalKeyboardKey.convert: TerminalLibraryFlutterKey.convert,
  LogicalKeyboardKey.nonConvert: TerminalLibraryFlutterKey.nonConvert,
  LogicalKeyboardKey.lang1: TerminalLibraryFlutterKey.lang1,
  LogicalKeyboardKey.lang2: TerminalLibraryFlutterKey.lang2,
  LogicalKeyboardKey.lang3: TerminalLibraryFlutterKey.lang3,
  LogicalKeyboardKey.lang4: TerminalLibraryFlutterKey.lang4,
  LogicalKeyboardKey.lang5: TerminalLibraryFlutterKey.lang5,
  LogicalKeyboardKey.abort: TerminalLibraryFlutterKey.abort,
  LogicalKeyboardKey.props: TerminalLibraryFlutterKey.props,
  LogicalKeyboardKey.numpadParenLeft: TerminalLibraryFlutterKey.numpadParenLeft,
  LogicalKeyboardKey.numpadParenRight:
      TerminalLibraryFlutterKey.numpadParenRight,
  LogicalKeyboardKey.controlLeft: TerminalLibraryFlutterKey.controlLeft,
  LogicalKeyboardKey.shiftLeft: TerminalLibraryFlutterKey.shiftLeft,
  LogicalKeyboardKey.altLeft: TerminalLibraryFlutterKey.altLeft,
  LogicalKeyboardKey.metaLeft: TerminalLibraryFlutterKey.metaLeft,
  LogicalKeyboardKey.controlRight: TerminalLibraryFlutterKey.controlRight,
  LogicalKeyboardKey.shiftRight: TerminalLibraryFlutterKey.shiftRight,
  LogicalKeyboardKey.altRight: TerminalLibraryFlutterKey.altRight,
  LogicalKeyboardKey.metaRight: TerminalLibraryFlutterKey.metaRight,
  LogicalKeyboardKey.info: TerminalLibraryFlutterKey.info,
  LogicalKeyboardKey.closedCaptionToggle:
      TerminalLibraryFlutterKey.closedCaptionToggle,
  LogicalKeyboardKey.brightnessUp: TerminalLibraryFlutterKey.brightnessUp,
  LogicalKeyboardKey.brightnessDown: TerminalLibraryFlutterKey.brightnessDown,
  LogicalKeyboardKey.mediaLast: TerminalLibraryFlutterKey.mediaLast,
  LogicalKeyboardKey.launchPhone: TerminalLibraryFlutterKey.launchPhone,
  LogicalKeyboardKey.exit: TerminalLibraryFlutterKey.exit,
  LogicalKeyboardKey.channelUp: TerminalLibraryFlutterKey.channelUp,
  LogicalKeyboardKey.channelDown: TerminalLibraryFlutterKey.channelDown,
  LogicalKeyboardKey.mediaPlay: TerminalLibraryFlutterKey.mediaPlay,
  LogicalKeyboardKey.mediaPause: TerminalLibraryFlutterKey.mediaPause,
  LogicalKeyboardKey.mediaRecord: TerminalLibraryFlutterKey.mediaRecord,
  LogicalKeyboardKey.mediaFastForward:
      TerminalLibraryFlutterKey.mediaFastForward,
  LogicalKeyboardKey.mediaRewind: TerminalLibraryFlutterKey.mediaRewind,
  LogicalKeyboardKey.mediaTrackNext: TerminalLibraryFlutterKey.mediaTrackNext,
  LogicalKeyboardKey.mediaTrackPrevious:
      TerminalLibraryFlutterKey.mediaTrackPrevious,
  LogicalKeyboardKey.mediaStop: TerminalLibraryFlutterKey.mediaStop,
  LogicalKeyboardKey.eject: TerminalLibraryFlutterKey.eject,
  LogicalKeyboardKey.mediaPlayPause: TerminalLibraryFlutterKey.mediaPlayPause,
  LogicalKeyboardKey.speechInputToggle:
      TerminalLibraryFlutterKey.speechInputToggle,
  LogicalKeyboardKey.launchWordProcessor:
      TerminalLibraryFlutterKey.launchWordProcessor,
  LogicalKeyboardKey.launchSpreadsheet:
      TerminalLibraryFlutterKey.launchSpreadsheet,
  LogicalKeyboardKey.launchMail: TerminalLibraryFlutterKey.launchMail,
  LogicalKeyboardKey.launchContacts: TerminalLibraryFlutterKey.launchContacts,
  LogicalKeyboardKey.launchCalendar: TerminalLibraryFlutterKey.launchCalendar,
  LogicalKeyboardKey.logOff: TerminalLibraryFlutterKey.logOff,
  LogicalKeyboardKey.launchControlPanel:
      TerminalLibraryFlutterKey.launchControlPanel,
  LogicalKeyboardKey.spellCheck: TerminalLibraryFlutterKey.spellCheck,
  LogicalKeyboardKey.launchScreenSaver:
      TerminalLibraryFlutterKey.launchScreenSaver,
  LogicalKeyboardKey.launchAssistant: TerminalLibraryFlutterKey.launchAssistant,
  LogicalKeyboardKey.newKey: TerminalLibraryFlutterKey.newKey,
  LogicalKeyboardKey.close: TerminalLibraryFlutterKey.close,
  LogicalKeyboardKey.save: TerminalLibraryFlutterKey.save,
  LogicalKeyboardKey.print: TerminalLibraryFlutterKey.print,
  LogicalKeyboardKey.browserSearch: TerminalLibraryFlutterKey.browserSearch,
  LogicalKeyboardKey.browserHome: TerminalLibraryFlutterKey.browserHome,
  LogicalKeyboardKey.browserBack: TerminalLibraryFlutterKey.browserBack,
  LogicalKeyboardKey.browserForward: TerminalLibraryFlutterKey.browserForward,
  LogicalKeyboardKey.browserStop: TerminalLibraryFlutterKey.browserStop,
  LogicalKeyboardKey.browserRefresh: TerminalLibraryFlutterKey.browserRefresh,
  LogicalKeyboardKey.browserFavorites:
      TerminalLibraryFlutterKey.browserFavorites,
  LogicalKeyboardKey.zoomIn: TerminalLibraryFlutterKey.zoomIn,
  LogicalKeyboardKey.zoomOut: TerminalLibraryFlutterKey.zoomOut,
  LogicalKeyboardKey.zoomToggle: TerminalLibraryFlutterKey.zoomToggle,
  LogicalKeyboardKey.redo: TerminalLibraryFlutterKey.redo,
  LogicalKeyboardKey.mailReply: TerminalLibraryFlutterKey.mailReply,
  LogicalKeyboardKey.mailForward: TerminalLibraryFlutterKey.mailForward,
  LogicalKeyboardKey.mailSend: TerminalLibraryFlutterKey.mailSend,
  LogicalKeyboardKey.gameButton1: TerminalLibraryFlutterKey.gameButton1,
  LogicalKeyboardKey.gameButton2: TerminalLibraryFlutterKey.gameButton2,
  LogicalKeyboardKey.gameButton3: TerminalLibraryFlutterKey.gameButton3,
  LogicalKeyboardKey.gameButton4: TerminalLibraryFlutterKey.gameButton4,
  LogicalKeyboardKey.gameButton5: TerminalLibraryFlutterKey.gameButton5,
  LogicalKeyboardKey.gameButton6: TerminalLibraryFlutterKey.gameButton6,
  LogicalKeyboardKey.gameButton7: TerminalLibraryFlutterKey.gameButton7,
  LogicalKeyboardKey.gameButton8: TerminalLibraryFlutterKey.gameButton8,
  LogicalKeyboardKey.gameButton9: TerminalLibraryFlutterKey.gameButton9,
  LogicalKeyboardKey.gameButton10: TerminalLibraryFlutterKey.gameButton10,
  LogicalKeyboardKey.gameButton11: TerminalLibraryFlutterKey.gameButton11,
  LogicalKeyboardKey.gameButton12: TerminalLibraryFlutterKey.gameButton12,
  LogicalKeyboardKey.gameButton13: TerminalLibraryFlutterKey.gameButton13,
  LogicalKeyboardKey.gameButton14: TerminalLibraryFlutterKey.gameButton14,
  LogicalKeyboardKey.gameButton15: TerminalLibraryFlutterKey.gameButton15,
  LogicalKeyboardKey.gameButton16: TerminalLibraryFlutterKey.gameButton16,
  LogicalKeyboardKey.gameButtonA: TerminalLibraryFlutterKey.gameButtonA,
  LogicalKeyboardKey.gameButtonB: TerminalLibraryFlutterKey.gameButtonB,
  LogicalKeyboardKey.gameButtonC: TerminalLibraryFlutterKey.gameButtonC,
  LogicalKeyboardKey.gameButtonLeft1: TerminalLibraryFlutterKey.gameButtonLeft1,
  LogicalKeyboardKey.gameButtonLeft2: TerminalLibraryFlutterKey.gameButtonLeft2,
  LogicalKeyboardKey.gameButtonMode: TerminalLibraryFlutterKey.gameButtonMode,
  LogicalKeyboardKey.gameButtonRight1:
      TerminalLibraryFlutterKey.gameButtonRight1,
  LogicalKeyboardKey.gameButtonRight2:
      TerminalLibraryFlutterKey.gameButtonRight2,
  LogicalKeyboardKey.gameButtonSelect:
      TerminalLibraryFlutterKey.gameButtonSelect,
  LogicalKeyboardKey.gameButtonStart: TerminalLibraryFlutterKey.gameButtonStart,
  LogicalKeyboardKey.gameButtonThumbLeft:
      TerminalLibraryFlutterKey.gameButtonThumbLeft,
  LogicalKeyboardKey.gameButtonThumbRight:
      TerminalLibraryFlutterKey.gameButtonThumbRight,
  LogicalKeyboardKey.gameButtonX: TerminalLibraryFlutterKey.gameButtonX,
  LogicalKeyboardKey.gameButtonY: TerminalLibraryFlutterKey.gameButtonY,
  LogicalKeyboardKey.gameButtonZ: TerminalLibraryFlutterKey.gameButtonZ,
  LogicalKeyboardKey.fn: TerminalLibraryFlutterKey.fn,
  LogicalKeyboardKey.shift: TerminalLibraryFlutterKey.shift,
  LogicalKeyboardKey.meta: TerminalLibraryFlutterKey.meta,
  LogicalKeyboardKey.alt: TerminalLibraryFlutterKey.alt,
  LogicalKeyboardKey.control: TerminalLibraryFlutterKey.control,
};

final _keyById = () {
  final map = <int, TerminalLibraryFlutterKey>{};
  for (final entry in _keyToTerminalLibraryFlutterKey.entries) {
    map[entry.key.keyId] = entry.value;
  }
  return map;
}();

final _keyByChar = () {
  final map = <String, TerminalLibraryFlutterKey>{};
  for (final entry in _keyToTerminalLibraryFlutterKey.entries) {
    final label = entry.key.keyLabel;

    if (label.isEmpty || label.length > 1) {
      continue;
    }

    map[label] = entry.value;
    map[label.toUpperCase()] = entry.value;
    map[label.toLowerCase()] = entry.value;
  }
  return map;
}();

/// Converts a [LogicalKeyboardKey] to a [TerminalLibraryFlutterKey]. Returns `null` if the
/// key does not have a corresponding [TerminalLibraryFlutterKey].
///
/// For example, `LogicalKeyboardKey.keyA` will be converted to
/// `TerminalLibraryFlutterKey.keyA`.
TerminalLibraryFlutterKey? keyToTerminalLibraryFlutterKey(
    LogicalKeyboardKey key) {
  return _keyById[key.keyId];
}

/// Converts a character to a [TerminalLibraryFlutterKey]. Returns `null` if the character
/// does not have a corresponding [TerminalLibraryFlutterKey].
///
/// For example, `charToTerminalLibraryFlutterKey('a')` or `charToTerminalLibraryFlutterKey('A')` will both
/// return [TerminalLibraryFlutterKey.a].
TerminalLibraryFlutterKey? charToTerminalLibraryFlutterKey(String char) {
  if (char.length != 1) {
    return null;
  }

  return _keyByChar[char];
}

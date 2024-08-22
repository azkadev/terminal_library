import 'package:terminal_library/xterm_library/core/core/input/keys.dart';

/// See: https://doc.qt.io/qt-5/qt.html#Key-enum
const qtKeynameMap = <String, TerminalLibraryFlutterKey>{
  'Escape': TerminalLibraryFlutterKey.escape,
  'Tab': TerminalLibraryFlutterKey.tab,
  'Backtab': TerminalLibraryFlutterKey.backtab,
  'Backspace': TerminalLibraryFlutterKey.backspace,
  'Return': TerminalLibraryFlutterKey.returnKey,
  'Enter': TerminalLibraryFlutterKey.enter,
  'NumEnter': TerminalLibraryFlutterKey.numpadEnter,
  'Insert': TerminalLibraryFlutterKey.insert,
  'Delete': TerminalLibraryFlutterKey.delete,
  'Pause': TerminalLibraryFlutterKey.pause,
  'Print': TerminalLibraryFlutterKey.print,
// 'SysReq': TerminalLibraryFlutterKey.sysReq,
  'Clear': TerminalLibraryFlutterKey.numpadClear,
  'Home': TerminalLibraryFlutterKey.home,
  'End': TerminalLibraryFlutterKey.end,
  'Left': TerminalLibraryFlutterKey.arrowLeft,
  'Up': TerminalLibraryFlutterKey.arrowUp,
  'Right': TerminalLibraryFlutterKey.arrowRight,
  'Down': TerminalLibraryFlutterKey.arrowDown,
  'PageUp': TerminalLibraryFlutterKey.pageUp,
  'PageDown': TerminalLibraryFlutterKey.pageDown,
  'PgUp': TerminalLibraryFlutterKey.pageUp,
  'PgDown': TerminalLibraryFlutterKey.pageDown,
  'Shift': TerminalLibraryFlutterKey.shift,
  'Control': TerminalLibraryFlutterKey.control,
  'Meta': TerminalLibraryFlutterKey.meta,
  'Alt': TerminalLibraryFlutterKey.alt,
// 'AltGr': TerminalLibraryFlutterKey.altGr,
  'CapsLock': TerminalLibraryFlutterKey.capsLock,
  'NumLock': TerminalLibraryFlutterKey.numLock,
  'ScrollLock': TerminalLibraryFlutterKey.scrollLock,
  'F1': TerminalLibraryFlutterKey.f1,
  'F2': TerminalLibraryFlutterKey.f2,
  'F3': TerminalLibraryFlutterKey.f3,
  'F4': TerminalLibraryFlutterKey.f4,
  'F5': TerminalLibraryFlutterKey.f5,
  'F6': TerminalLibraryFlutterKey.f6,
  'F7': TerminalLibraryFlutterKey.f7,
  'F8': TerminalLibraryFlutterKey.f8,
  'F9': TerminalLibraryFlutterKey.f9,
  'F10': TerminalLibraryFlutterKey.f10,
  'F11': TerminalLibraryFlutterKey.f11,
  'F12': TerminalLibraryFlutterKey.f12,
  'F13': TerminalLibraryFlutterKey.f13,
  'F14': TerminalLibraryFlutterKey.f14,
  'F15': TerminalLibraryFlutterKey.f15,
  'F16': TerminalLibraryFlutterKey.f16,
  'F17': TerminalLibraryFlutterKey.f17,
  'F18': TerminalLibraryFlutterKey.f18,
  'F19': TerminalLibraryFlutterKey.f19,
  'F20': TerminalLibraryFlutterKey.f20,
  'F21': TerminalLibraryFlutterKey.f21,
  'F22': TerminalLibraryFlutterKey.f22,
  'F23': TerminalLibraryFlutterKey.f23,
  'F24': TerminalLibraryFlutterKey.f24,
// 'F25': TerminalLibraryFlutterKey.f25,
// 'F26': TerminalLibraryFlutterKey.f26,
// 'F27': TerminalLibraryFlutterKey.f27,
// 'F28': TerminalLibraryFlutterKey.f28,
// 'F29': TerminalLibraryFlutterKey.f29,
// 'F30': TerminalLibraryFlutterKey.f30,
// 'F31': TerminalLibraryFlutterKey.f31,
// 'F32': TerminalLibraryFlutterKey.f32,
// 'F33': TerminalLibraryFlutterKey.f33,
// 'F34': TerminalLibraryFlutterKey.f34,
// 'F35': TerminalLibraryFlutterKey.f35,
// 'Super_L': TerminalLibraryFlutterKey.super_L,
// 'Super_R': TerminalLibraryFlutterKey.super_R,
// 'Menu': TerminalLibraryFlutterKey.menu,
// 'Hyper_L': TerminalLibraryFlutterKey.hyper_L,
// 'Hyper_R': TerminalLibraryFlutterKey.hyper_R,
  'Help': TerminalLibraryFlutterKey.help,
// 'Direction_L': TerminalLibraryFlutterKey.direction_L,
// 'Direction_R': TerminalLibraryFlutterKey.direction_R,
  'Space': TerminalLibraryFlutterKey.space,
  // 'Any': TerminalLibraryFlutterKey.any,
  // 'Exclam': TerminalLibraryFlutterKey.exclam,
  // 'QuoteDbl': TerminalLibraryFlutterKey.quoteDbl,
  // 'NumberSign': TerminalLibraryFlutterKey.numberSign,
  // 'Dollar': TerminalLibraryFlutterKey.dollar,
  // 'Percent': TerminalLibraryFlutterKey.percent,
  // 'Ampersand': TerminalLibraryFlutterKey.ampersand,
  // 'Apostrophe': TerminalLibraryFlutterKey.apostrophe,
  'ParenLeft': TerminalLibraryFlutterKey.numpadParenLeft,
  'ParenRight': TerminalLibraryFlutterKey.numpadParenRight,
  // 'Asterisk': TerminalLibraryFlutterKey.asterisk,
  // 'Plus': TerminalLibraryFlutterKey.plus,
  'Comma': TerminalLibraryFlutterKey.comma,
  'Minus': TerminalLibraryFlutterKey.minus,
  'Period': TerminalLibraryFlutterKey.period,
  'Slash': TerminalLibraryFlutterKey.slash,
  '0': TerminalLibraryFlutterKey.digit0,
  '1': TerminalLibraryFlutterKey.digit1,
  '2': TerminalLibraryFlutterKey.digit2,
  '3': TerminalLibraryFlutterKey.digit3,
  '4': TerminalLibraryFlutterKey.digit4,
  '5': TerminalLibraryFlutterKey.digit5,
  '6': TerminalLibraryFlutterKey.digit6,
  '7': TerminalLibraryFlutterKey.digit7,
  '8': TerminalLibraryFlutterKey.digit8,
  '9': TerminalLibraryFlutterKey.digit9,
// 'Colon': TerminalLibraryFlutterKey.colon,
  'Semicolon': TerminalLibraryFlutterKey.semicolon,
// 'Less': TerminalLibraryFlutterKey.less,
// 'Equal': TerminalLibraryFlutterKey.equal,
// 'Greater': TerminalLibraryFlutterKey.greater,
// 'Question': TerminalLibraryFlutterKey.question,
// 'At': TerminalLibraryFlutterKey.at,
  'A': TerminalLibraryFlutterKey.keyA,
  'B': TerminalLibraryFlutterKey.keyB,
  'C': TerminalLibraryFlutterKey.keyC,
  'D': TerminalLibraryFlutterKey.keyD,
  'E': TerminalLibraryFlutterKey.keyE,
  'F': TerminalLibraryFlutterKey.keyF,
  'G': TerminalLibraryFlutterKey.keyG,
  'H': TerminalLibraryFlutterKey.keyH,
  'I': TerminalLibraryFlutterKey.keyI,
  'J': TerminalLibraryFlutterKey.keyJ,
  'K': TerminalLibraryFlutterKey.keyK,
  'L': TerminalLibraryFlutterKey.keyL,
  'M': TerminalLibraryFlutterKey.keyM,
  'N': TerminalLibraryFlutterKey.keyN,
  'O': TerminalLibraryFlutterKey.keyO,
  'P': TerminalLibraryFlutterKey.keyP,
  'Q': TerminalLibraryFlutterKey.keyQ,
  'R': TerminalLibraryFlutterKey.keyR,
  'S': TerminalLibraryFlutterKey.keyS,
  'T': TerminalLibraryFlutterKey.keyT,
  'U': TerminalLibraryFlutterKey.keyU,
  'V': TerminalLibraryFlutterKey.keyV,
  'W': TerminalLibraryFlutterKey.keyW,
  'X': TerminalLibraryFlutterKey.keyX,
  'Y': TerminalLibraryFlutterKey.keyY,
  'Z': TerminalLibraryFlutterKey.keyZ,
  'BracketLeft': TerminalLibraryFlutterKey.bracketLeft,
  'Backslash': TerminalLibraryFlutterKey.backslash,
  'BracketRight': TerminalLibraryFlutterKey.bracketRight,
// 'AsciiCircum': TerminalLibraryFlutterKey.asciiCircum,
  // 'Underscore': TerminalLibraryFlutterKey.underscore,
  // 'QuoteLeft': TerminalLibraryFlutterKey.quoteLeft,
// 'BraceLeft': TerminalLibraryFlutterKey.braceLeft,
  // 'Bar': TerminalLibraryFlutterKey.bar,
// 'BraceRight': TerminalLibraryFlutterKey.braceRight,
  // 'AsciiTilde': TerminalLibraryFlutterKey.asciiTilde,
// 'nobreakspace': TerminalLibraryFlutterKey.nobreakspace,
// 'exclamdown': TerminalLibraryFlutterKey.exclamdown,
// 'cent': TerminalLibraryFlutterKey.cent,
// 'sterling': TerminalLibraryFlutterKey.sterling,
// 'currency': TerminalLibraryFlutterKey.currency,
// 'yen': TerminalLibraryFlutterKey.yen,
// 'brokenbar': TerminalLibraryFlutterKey.brokenbar,
// 'section': TerminalLibraryFlutterKey.section,
// 'diaeresis': TerminalLibraryFlutterKey.diaeresis,
// 'copyright': TerminalLibraryFlutterKey.copyright,
// 'ordfeminine': TerminalLibraryFlutterKey.ordfeminine,
// 'guillemotleft': TerminalLibraryFlutterKey.guillemotleft,
// 'notsign': TerminalLibraryFlutterKey.notsign,
// 'hyphen': TerminalLibraryFlutterKey.hyphen,
// 'registered': TerminalLibraryFlutterKey.registered,
// 'macron': TerminalLibraryFlutterKey.macron,
// 'degree': TerminalLibraryFlutterKey.degree,
// 'plusminus': TerminalLibraryFlutterKey.plusminus,
// 'twosuperior': TerminalLibraryFlutterKey.twosuperior,
// 'threesuperior': TerminalLibraryFlutterKey.threesuperior,
// 'acute': TerminalLibraryFlutterKey.acute,
// // 'mu': TerminalLibraryFlutterKey.mu,
// 'paragraph': TerminalLibraryFlutterKey.paragraph,
// 'periodcentered': TerminalLibraryFlutterKey.periodcentered,
// 'cedilla': TerminalLibraryFlutterKey.cedilla,
// 'onesuperior': TerminalLibraryFlutterKey.onesuperior,
// 'masculine': TerminalLibraryFlutterKey.masculine,
// 'guillemotright': TerminalLibraryFlutterKey.guillemotright,
// 'onequarter': TerminalLibraryFlutterKey.onequarter,
// 'onehalf': TerminalLibraryFlutterKey.onehalf,
// 'threequarters': TerminalLibraryFlutterKey.threequarters,
// 'questiondown': TerminalLibraryFlutterKey.questiondown,
// 'Agrave': TerminalLibraryFlutterKey.agrave,
// 'Aacute': TerminalLibraryFlutterKey.aacute,
// 'Acircumflex': TerminalLibraryFlutterKey.acircumflex,
// 'Atilde': TerminalLibraryFlutterKey.atilde,
// 'Adiaeresis': TerminalLibraryFlutterKey.adiaeresis,
// 'Aring': TerminalLibraryFlutterKey.aring,
// 'AE': TerminalLibraryFlutterKey.aE,
// 'Ccedilla': TerminalLibraryFlutterKey.ccedilla,
// 'Egrave': TerminalLibraryFlutterKey.egrave,
// 'Eacute': TerminalLibraryFlutterKey.eacute,
// 'Ecircumflex': TerminalLibraryFlutterKey.ecircumflex,
// 'Ediaeresis': TerminalLibraryFlutterKey.ediaeresis,
// 'Igrave': TerminalLibraryFlutterKey.igrave,
// 'Iacute': TerminalLibraryFlutterKey.iacute,
// 'Icircumflex': TerminalLibraryFlutterKey.icircumflex,
// 'Idiaeresis': TerminalLibraryFlutterKey.idiaeresis,
// 'ETH': TerminalLibraryFlutterKey.eTH,
// 'Ntilde': TerminalLibraryFlutterKey.ntilde,
// 'Ograve': TerminalLibraryFlutterKey.ograve,
// 'Oacute': TerminalLibraryFlutterKey.oacute,
// 'Ocircumflex': TerminalLibraryFlutterKey.ocircumflex,
// 'Otilde': TerminalLibraryFlutterKey.otilde,
// 'Odiaeresis': TerminalLibraryFlutterKey.odiaeresis,
// 'multiply': TerminalLibraryFlutterKey.multiply,
// 'Ooblique': TerminalLibraryFlutterKey.ooblique,
// 'Ugrave': TerminalLibraryFlutterKey.ugrave,
// 'Uacute': TerminalLibraryFlutterKey.uacute,
// 'Ucircumflex': TerminalLibraryFlutterKey.ucircumflex,
// 'Udiaeresis': TerminalLibraryFlutterKey.udiaeresis,
// 'Yacute': TerminalLibraryFlutterKey.yacute,
// 'THORN': TerminalLibraryFlutterKey.tHORN,
// 'ssharp': TerminalLibraryFlutterKey.ssharp,
// 'division': TerminalLibraryFlutterKey.division,
// 'ydiaeresis': TerminalLibraryFlutterKey.ydiaeresis,
// 'Multi_key': TerminalLibraryFlutterKey.multi_key,
// 'Codeinput': TerminalLibraryFlutterKey.codeinput,
// 'SingleCandidate': TerminalLibraryFlutterKey.singleCandidate,
// 'MultipleCandidate': TerminalLibraryFlutterKey.multipleCandidate,
// 'PreviousCandidate': TerminalLibraryFlutterKey.previousCandidate,
// 'Mode_switch': TerminalLibraryFlutterKey.mode_switch,
// 'Kanji': TerminalLibraryFlutterKey.kanji,
// 'Muhenkan': TerminalLibraryFlutterKey.muhenkan,
// 'Henkan': TerminalLibraryFlutterKey.henkan,
// 'Romaji': TerminalLibraryFlutterKey.romaji,
// 'Hiragana': TerminalLibraryFlutterKey.hiragana,
// 'Katakana': TerminalLibraryFlutterKey.katakana,
// 'Hiragana_Katakana': TerminalLibraryFlutterKey.hiragana_Katakana,
// 'Zenkaku': TerminalLibraryFlutterKey.zenkaku,
// 'Hankaku': TerminalLibraryFlutterKey.hankaku,
// 'Zenkaku_Hankaku': TerminalLibraryFlutterKey.zenkaku_Hankaku,
// 'Touroku': TerminalLibraryFlutterKey.touroku,
// 'Massyo': TerminalLibraryFlutterKey.massyo,
// 'Kana_Lock': TerminalLibraryFlutterKey.kana_Lock,
// 'Kana_Shift': TerminalLibraryFlutterKey.kana_Shift,
// 'Eisu_Shift': TerminalLibraryFlutterKey.eisu_Shift,
// 'Eisu_toggle': TerminalLibraryFlutterKey.eisu_toggle,
// 'Hangul': TerminalLibraryFlutterKey.hangul,
// 'Hangul_Start': TerminalLibraryFlutterKey.hangul_Start,
// 'Hangul_End': TerminalLibraryFlutterKey.hangul_End,
// 'Hangul_Hanja': TerminalLibraryFlutterKey.hangul_Hanja,
// 'Hangul_Jamo': TerminalLibraryFlutterKey.hangul_Jamo,
// 'Hangul_Romaja': TerminalLibraryFlutterKey.hangul_Romaja,
// 'Hangul_Jeonja': TerminalLibraryFlutterKey.hangul_Jeonja,
// 'Hangul_Banja': TerminalLibraryFlutterKey.hangul_Banja,
// 'Hangul_PreHanja': TerminalLibraryFlutterKey.hangul_PreHanja,
// 'Hangul_PostHanja': TerminalLibraryFlutterKey.hangul_PostHanja,
// 'Hangul_Special': TerminalLibraryFlutterKey.hangul_Special,
// 'Dead_Grave': TerminalLibraryFlutterKey.dead_Grave,
// 'Dead_Acute': TerminalLibraryFlutterKey.dead_Acute,
// 'Dead_Circumflex': TerminalLibraryFlutterKey.dead_Circumflex,
// 'Dead_Tilde': TerminalLibraryFlutterKey.dead_Tilde,
// 'Dead_Macron': TerminalLibraryFlutterKey.dead_Macron,
// 'Dead_Breve': TerminalLibraryFlutterKey.dead_Breve,
// 'Dead_Abovedot': TerminalLibraryFlutterKey.dead_Abovedot,
// 'Dead_Diaeresis': TerminalLibraryFlutterKey.dead_Diaeresis,
// 'Dead_Abovering': TerminalLibraryFlutterKey.dead_Abovering,
// 'Dead_Doubleacute': TerminalLibraryFlutterKey.dead_Doubleacute,
// 'Dead_Caron': TerminalLibraryFlutterKey.dead_Caron,
// 'Dead_Cedilla': TerminalLibraryFlutterKey.dead_Cedilla,
// 'Dead_Ogonek': TerminalLibraryFlutterKey.dead_Ogonek,
// 'Dead_Iota': TerminalLibraryFlutterKey.dead_Iota,
// 'Dead_Voiced_Sound': TerminalLibraryFlutterKey.dead_Voiced_Sound,
// 'Dead_Semivoiced_Sound': TerminalLibraryFlutterKey.dead_Semivoiced_Sound,
// 'Dead_Belowdot': TerminalLibraryFlutterKey.dead_Belowdot,
// 'Dead_Hook': TerminalLibraryFlutterKey.dead_Hook,
// 'Dead_Horn': TerminalLibraryFlutterKey.dead_Horn,
// 'Dead_Stroke': TerminalLibraryFlutterKey.dead_Stroke,
// 'Dead_Abovecomma': TerminalLibraryFlutterKey.dead_Abovecomma,
// 'Dead_Abovereversedcomma': TerminalLibraryFlutterKey.dead_Abovereversedcomma,
// 'Dead_Doublegrave': TerminalLibraryFlutterKey.dead_Doublegrave,
// 'Dead_Belowring': TerminalLibraryFlutterKey.dead_Belowring,
// 'Dead_Belowmacron': TerminalLibraryFlutterKey.dead_Belowmacron,
// 'Dead_Belowcircumflex': TerminalLibraryFlutterKey.dead_Belowcircumflex,
// 'Dead_Belowtilde': TerminalLibraryFlutterKey.dead_Belowtilde,
// 'Dead_Belowbreve': TerminalLibraryFlutterKey.dead_Belowbreve,
// 'Dead_Belowdiaeresis': TerminalLibraryFlutterKey.dead_Belowdiaeresis,
// 'Dead_Invertedbreve': TerminalLibraryFlutterKey.dead_Invertedbreve,
// 'Dead_Belowcomma': TerminalLibraryFlutterKey.dead_Belowcomma,
// 'Dead_Currency': TerminalLibraryFlutterKey.dead_Currency,
// 'Dead_a': TerminalLibraryFlutterKey.dead_a,
// 'Dead_A': TerminalLibraryFlutterKey.dead_A,
// 'Dead_e': TerminalLibraryFlutterKey.dead_e,
// 'Dead_E': TerminalLibraryFlutterKey.dead_E,
// 'Dead_i': TerminalLibraryFlutterKey.dead_i,
// 'Dead_I': TerminalLibraryFlutterKey.dead_I,
// 'Dead_o': TerminalLibraryFlutterKey.dead_o,
// 'Dead_O': TerminalLibraryFlutterKey.dead_O,
// 'Dead_u': TerminalLibraryFlutterKey.dead_u,
// 'Dead_U': TerminalLibraryFlutterKey.dead_U,
// 'Dead_Small_Schwa': TerminalLibraryFlutterKey.dead_Small_Schwa,
// 'Dead_Capital_Schwa': TerminalLibraryFlutterKey.dead_Capital_Schwa,
// 'Dead_Greek': TerminalLibraryFlutterKey.dead_Greek,
// 'Dead_Lowline': TerminalLibraryFlutterKey.dead_Lowline,
// 'Dead_Aboveverticalline': TerminalLibraryFlutterKey.dead_Aboveverticalline,
// 'Dead_Belowverticalline': TerminalLibraryFlutterKey.dead_Belowverticalline,
// 'Dead_Longsolidusoverlay': TerminalLibraryFlutterKey.dead_Longsolidusoverlay,
// 'Back': TerminalLibraryFlutterKey.back,
// 'Forward': TerminalLibraryFlutterKey.forward,
// 'Stop': TerminalLibraryFlutterKey.stop,
// 'Refresh': TerminalLibraryFlutterKey.refresh,
  'VolumeDown': TerminalLibraryFlutterKey.audioVolumeDown,
  'VolumeMute': TerminalLibraryFlutterKey.audioVolumeMute,
  'VolumeUp': TerminalLibraryFlutterKey.audioVolumeUp,
  'BassBoost': TerminalLibraryFlutterKey.bassBoost,
// 'BassUp': TerminalLibraryFlutterKey.bassUp,
// 'BassDown': TerminalLibraryFlutterKey.bassDown,
// 'TrebleUp': TerminalLibraryFlutterKey.trebleUp,
// 'TrebleDown': TerminalLibraryFlutterKey.trebleDown,
  'MediaPlay': TerminalLibraryFlutterKey.mediaPlay,
  'MediaStop': TerminalLibraryFlutterKey.mediaStop,
// 'MediaPrevious': TerminalLibraryFlutterKey.mediaPrevious,
// 'MediaNext': TerminalLibraryFlutterKey.mediaNext,
  'MediaRecord': TerminalLibraryFlutterKey.mediaRecord,
  'MediaPause': TerminalLibraryFlutterKey.mediaPause,
  'MediaTogglePlayPause': TerminalLibraryFlutterKey.mediaPlayPause,
  'HomePage': TerminalLibraryFlutterKey.browserHome,
// 'Favorites': TerminalLibraryFlutterKey.favorites,
// 'Search': TerminalLibraryFlutterKey.search,
// 'Standby': TerminalLibraryFlutterKey.standby,
// 'OpenUrl': TerminalLibraryFlutterKey.openUrl,
// 'LaunchMail': TerminalLibraryFlutterKey.launchMail,
// 'LaunchMedia': TerminalLibraryFlutterKey.launchMedia,
// 'Launch0': TerminalLibraryFlutterKey.launch0,
// 'Launch1': TerminalLibraryFlutterKey.launch1,
// 'Launch2': TerminalLibraryFlutterKey.launch2,
// 'Launch3': TerminalLibraryFlutterKey.launch3,
// 'Launch4': TerminalLibraryFlutterKey.launch4,
// 'Launch5': TerminalLibraryFlutterKey.launch5,
// 'Launch6': TerminalLibraryFlutterKey.launch6,
// 'Launch7': TerminalLibraryFlutterKey.launch7,
// 'Launch8': TerminalLibraryFlutterKey.launch8,
// 'Launch9': TerminalLibraryFlutterKey.launch9,
// 'LaunchA': TerminalLibraryFlutterKey.launchA,
// 'LaunchB': TerminalLibraryFlutterKey.launchB,
// 'LaunchC': TerminalLibraryFlutterKey.launchC,
// 'LaunchD': TerminalLibraryFlutterKey.launchD,
// 'LaunchE': TerminalLibraryFlutterKey.launchE,
// 'LaunchF': TerminalLibraryFlutterKey.launchF,
// 'LaunchG': TerminalLibraryFlutterKey.launchG,
// 'LaunchH': TerminalLibraryFlutterKey.launchH,
  'MonBrightnessUp': TerminalLibraryFlutterKey.brightnessUp,
  'MonBrightnessDown': TerminalLibraryFlutterKey.brightnessDown,
// 'KeyboardLightOnOff': TerminalLibraryFlutterKey.keyboardLightOnOff,
// 'KeyboardBrightnessUp': TerminalLibraryFlutterKey.keyboardBrightnessUp,
// 'KeyboardBrightnessDown': TerminalLibraryFlutterKey.keyboardBrightnessDown,
  'PowerOff': TerminalLibraryFlutterKey.power,
  'WakeUp': TerminalLibraryFlutterKey.wakeUp,
  'Eject': TerminalLibraryFlutterKey.eject,
// 'ScreenSaver': TerminalLibraryFlutterKey.screenSaver,
// 'WWW': TerminalLibraryFlutterKey.wWW,
// 'Memo': TerminalLibraryFlutterKey.memo,
// 'LightBulb': TerminalLibraryFlutterKey.lightBulb,
// 'Shop': TerminalLibraryFlutterKey.shop,
// 'History': TerminalLibraryFlutterKey.history,
// 'AddFavorite': TerminalLibraryFlutterKey.addFavorite,
// 'HotLinks': TerminalLibraryFlutterKey.hotLinks,
// 'BrightnessAdjust': TerminalLibraryFlutterKey.brightnessAdjust,
// 'Finance': TerminalLibraryFlutterKey.finance,
// 'Community': TerminalLibraryFlutterKey.community,
// 'AudioRewind': TerminalLibraryFlutterKey.audioRewind,
// 'BackForward': TerminalLibraryFlutterKey.backForward,
// 'ApplicationLeft': TerminalLibraryFlutterKey.applicationLeft,
// 'ApplicationRight': TerminalLibraryFlutterKey.applicationRight,
// 'Book': TerminalLibraryFlutterKey.book,
// 'CD': TerminalLibraryFlutterKey.cD,
// 'Calculator': TerminalLibraryFlutterKey.calculator,
// 'ToDoList': TerminalLibraryFlutterKey.toDoList,
// 'ClearGrab': TerminalLibraryFlutterKey.clearGrab,
  'Close': TerminalLibraryFlutterKey.close,
  'Copy': TerminalLibraryFlutterKey.copy,
  'Cut': TerminalLibraryFlutterKey.cut,
// 'Display': TerminalLibraryFlutterKey.display,
// 'DOS': TerminalLibraryFlutterKey.dOS,
// 'Documents': TerminalLibraryFlutterKey.documents,
// 'Excel': TerminalLibraryFlutterKey.excel,
// 'Explorer': TerminalLibraryFlutterKey.explorer,
// 'Game': TerminalLibraryFlutterKey.game,
// 'Go': TerminalLibraryFlutterKey.go,
// 'iTouch': TerminalLibraryFlutterKey.iTouch,
// 'LogOff': TerminalLibraryFlutterKey.logOff,
// 'Market': TerminalLibraryFlutterKey.market,
// 'Meeting': TerminalLibraryFlutterKey.meeting,
// 'MenuKB': TerminalLibraryFlutterKey.menuKB,
// 'MenuPB': TerminalLibraryFlutterKey.menuPB,
// 'MySites': TerminalLibraryFlutterKey.mySites,
// 'News': TerminalLibraryFlutterKey.news,
// 'OfficeHome': TerminalLibraryFlutterKey.officeHome,
// 'Option': TerminalLibraryFlutterKey.option,
// 'Paste': TerminalLibraryFlutterKey.paste,
// 'Phone': TerminalLibraryFlutterKey.phone,
// 'Calendar': TerminalLibraryFlutterKey.calendar,
// 'Reply': TerminalLibraryFlutterKey.reply,
// 'Reload': TerminalLibraryFlutterKey.reload,
// 'RotateWindows': TerminalLibraryFlutterKey.rotateWindows,
// 'RotationPB': TerminalLibraryFlutterKey.rotationPB,
// 'RotationKB': TerminalLibraryFlutterKey.rotationKB,
  'Save': TerminalLibraryFlutterKey.save,
// 'Send': TerminalLibraryFlutterKey.send,
// 'Spell': TerminalLibraryFlutterKey.spell,
// 'SplitScreen': TerminalLibraryFlutterKey.splitScreen,
// 'Support': TerminalLibraryFlutterKey.support,
// 'TaskPane': TerminalLibraryFlutterKey.taskPane,
// 'TerminalLibraryFlutter': TerminalLibraryFlutterKey.terminal,
// 'Tools': TerminalLibraryFlutterKey.tools,
// 'Travel': TerminalLibraryFlutterKey.travel,
// 'Video': TerminalLibraryFlutterKey.video,
// 'Word': TerminalLibraryFlutterKey.word,
// 'Xfer': TerminalLibraryFlutterKey.xfer,
  'ZoomIn': TerminalLibraryFlutterKey.zoomIn,
  'ZoomOut': TerminalLibraryFlutterKey.zoomOut,
// 'Away': TerminalLibraryFlutterKey.away,
// 'Messenger': TerminalLibraryFlutterKey.messenger,
// 'WebCam': TerminalLibraryFlutterKey.webCam,
// 'MailForward': TerminalLibraryFlutterKey.mailForward,
// 'Pictures': TerminalLibraryFlutterKey.pictures,
// 'Music': TerminalLibraryFlutterKey.music,
// 'Battery': TerminalLibraryFlutterKey.battery,
// 'Bluetooth': TerminalLibraryFlutterKey.bluetooth,
// 'WLAN': TerminalLibraryFlutterKey.wLAN,
// 'UWB': TerminalLibraryFlutterKey.uWB,
// 'AudioForward': TerminalLibraryFlutterKey.audioForward,
// 'AudioRepeat': TerminalLibraryFlutterKey.audioRepeat,
// 'AudioRandomPlay': TerminalLibraryFlutterKey.audioRandomPlay,
// 'Subtitle': TerminalLibraryFlutterKey.subtitle,
// 'AudioCycleTrack': TerminalLibraryFlutterKey.audioCycleTrack,
// 'Time': TerminalLibraryFlutterKey.time,
// 'Hibernate': TerminalLibraryFlutterKey.hibernate,
// 'View': TerminalLibraryFlutterKey.view,
// 'TopMenu': TerminalLibraryFlutterKey.topMenu,
// 'PowerDown': TerminalLibraryFlutterKey.powerDown,
// 'Suspend': TerminalLibraryFlutterKey.suspend,
// 'ContrastAdjust': TerminalLibraryFlutterKey.contrastAdjust,
// 'TouchpadToggle': TerminalLibraryFlutterKey.touchpadToggle,
// 'TouchpadOn': TerminalLibraryFlutterKey.touchpadOn,
// 'TouchpadOff': TerminalLibraryFlutterKey.touchpadOff,
// 'MicMute': TerminalLibraryFlutterKey.micMute,
// 'Red': TerminalLibraryFlutterKey.red,
// 'Green': TerminalLibraryFlutterKey.green,
// 'Yellow': TerminalLibraryFlutterKey.yellow,
// 'Blue': TerminalLibraryFlutterKey.blue,
  'ChannelUp': TerminalLibraryFlutterKey.channelUp,
  'ChannelDown': TerminalLibraryFlutterKey.channelDown,
// 'Guide': TerminalLibraryFlutterKey.guide,
  'Info': TerminalLibraryFlutterKey.info,
// 'Settings': TerminalLibraryFlutterKey.settings,
// 'MicVolumeUp': TerminalLibraryFlutterKey.micVolumeUp,
// 'MicVolumeDown': TerminalLibraryFlutterKey.micVolumeDown,
// 'New': TerminalLibraryFlutterKey.new,
  'Open': TerminalLibraryFlutterKey.open,
  'Find': TerminalLibraryFlutterKey.find,
  'Undo': TerminalLibraryFlutterKey.undo,
  'Redo': TerminalLibraryFlutterKey.redo,
  'MediaLast': TerminalLibraryFlutterKey.mediaLast,
// 'unknown': TerminalLibraryFlutterKey.unknown,
// 'Call': TerminalLibraryFlutterKey.call,
// 'Camera': TerminalLibraryFlutterKey.camera,
// 'CameraFocus': TerminalLibraryFlutterKey.cameraFocus,
// 'Context1': TerminalLibraryFlutterKey.context1,
// 'Context2': TerminalLibraryFlutterKey.context2,
// 'Context3': TerminalLibraryFlutterKey.context3,
// 'Context4': TerminalLibraryFlutterKey.context4,
// 'Flip': TerminalLibraryFlutterKey.flip,
// 'Hangup': TerminalLibraryFlutterKey.hangup,
// 'No': TerminalLibraryFlutterKey.no,
  'Select': TerminalLibraryFlutterKey.select,
// 'Yes': TerminalLibraryFlutterKey.yes,
// 'ToggleCallHangup': TerminalLibraryFlutterKey.toggleCallHangup,
// 'VoiceDial': TerminalLibraryFlutterKey.voiceDial,
// 'LastNumberRedial': TerminalLibraryFlutterKey.lastNumberRedial,
// 'Execute': TerminalLibraryFlutterKey.execute,
// 'Printer': TerminalLibraryFlutterKey.printer,
// 'Play': TerminalLibraryFlutterKey.play,
  'Sleep': TerminalLibraryFlutterKey.sleep,
// 'Zoom': TerminalLibraryFlutterKey.zoom,
  'Exit': TerminalLibraryFlutterKey.exit,
// 'Cancel': TerminalLibraryFlutterKey.cancel,
};

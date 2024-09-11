// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, unnecessary_string_interpolations, deprecated_member_use
 

import 'base.dart';

/// TerminalPtyLibrary represents a process running in a pseudo-terminal.
///
/// To create a TerminalPtyLibrary, use [TerminalPtyLibrary.start].
class TerminalPtyLibrary extends TerminalPtyLibraryBase { 
  TerminalPtyLibrary({
    super.executable,
    super.workingDirectory,
    super.libraryPtyPath,
    super.arguments,
    super.columns,
    super.environment,
    super.isAckRead,
    super.rows,
  }); 
  static String get defaultShell {
    return 'sh';
  }

}

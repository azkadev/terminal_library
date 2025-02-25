// ignore_for_file: empty_catches, non_constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/extension/build_context.dart';
import 'package:general_lib_flutter/widget/widget.dart';
import 'package:terminal_library/pty_library/pty_library.dart';
import 'package:terminal_library/xterm_library/xterm.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        Widget child = MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: const MyApp(),
        );
        return child;
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TerminalLibraryFlutterController terminalLibraryFlutterController =
      TerminalLibraryFlutterController();
  final TerminalLibraryFlutter terminalLibraryFlutter = TerminalLibraryFlutter(
    maxLines: 1000,
    // inputHandler:
  );
  late final TerminalPtyLibrary ptyLibrary;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await refresh();
    });
  }

  @override
  void dispose() {
    ptyLibrary.kill();
    terminalLibraryFlutterController.dispose();
    super.dispose();
  }

  bool is_loading = false;
  Future<void> refresh() async {
    if (is_loading) {
      return;
    }
    setState(() {
      is_loading = true;
    });
    await Future(() async {
      await Future.delayed(Durations.short1);
      ptyLibrary = TerminalPtyLibrary(
        executable: TerminalPtyLibraryBase.defaultShell,
        columns: terminalLibraryFlutter.viewWidth,
        rows: terminalLibraryFlutter.viewHeight,
      );
      ptyLibrary.on(
        eventName: ptyLibrary.event_output,
        onCallback: onCallback,
      );
      // ptyLibrary.output.listen((event) {
      //   if (event.isNotEmpty) {
      //     try {
      //       terminalLibraryFlutter.write(utf8.decode(event, allowMalformed: true));
      //     } catch (e) {}
      //   }
      // });
      terminalLibraryFlutter.onOutput = (String value) {
        if (value.isNotEmpty) {
          try {
            // print(json.encode(value));
            ptyLibrary.write(utf8.encode(value));
          } catch (e) {}
        }
      };
      terminalLibraryFlutter.onResize = (w, h, pw, ph) {
        ptyLibrary.resize(h, w);
      };
      terminalLibraryFlutter.buffer.clear();
      terminalLibraryFlutter.buffer.setCursor(0, 0);
      terminalLibraryFlutter.textInput("clear");
      terminalLibraryFlutter.keyInput(TerminalLibraryFlutterKey.enter);
      terminalLibraryFlutter.write("Hello World");
      setState(() {});
    });
    setState(() {
      is_loading = false;
    });
  }

  FutureOr<dynamic> onCallback(dynamic update, TerminalPtyLibraryBase te) {
    if (update is Uint8List) {
      try {
        terminalLibraryFlutter.write(utf8.decode(update, allowMalformed: true));
      } catch (e) {}
    } else if (update is String) {
      terminalLibraryFlutter.write(update);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (is_loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: context.theme.indicatorColor,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terminal Library:"),
      ),
      body: TerminalLibraryFlutterViewWidget(
        terminalLibraryFlutter,
        controller: terminalLibraryFlutterController,
        autofocus: true,
        backgroundOpacity: 0,
        simulateScroll: true,
        padding: const EdgeInsets.all(5),
        alwaysShowCursor: true,
        deleteDetection: Dart.isMobile,
      ),
    );
  }
}

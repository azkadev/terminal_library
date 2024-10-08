# Terminal Library
 
**Terminal Library** for dart and flutter support cross platform with user friendly, so this will help you to integrated terminal to your app without any hastle

## Demo
 

## 📚️ Docs

1. [Documentation]({url_documentation})
2. [Youtube](https://youtube.com/azkadev)
3. [Telegram Support Group](https://t.me/{telegram_support_username})
4. [Contact Developer](https://github.com/azkadev) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [x] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [x] ✨️ **Pretty Information** (user friendly for newbie)
7. [x] 🔥️ **Multi Function** One library with multi function (INCLUDE SSH CLIENT) so you can connect ssh terminal or acces file using SFTP without any hastle

## ❔️ Fun Fact

This library work on everywhere platform (cli, server, web, gui) ignore flutter flag only pub.dev

## Support

I Really need energy for make this library easy to use please help me like

1. [Sponsor / Donate Me On Github](https://github.com/azkadev)
2. [Follow My Youtube Account](https://youtube.com/@azkadev)
3. [Buy Services On Telegram Bot](https://t.me/azkadevbot?start=buy_services)

### 📥️ Install Library

1. **Dart**

```bash
dart pub add terminal_library
```

2. **Flutter**

```bash
flutter pub add terminal_library
```
 
## ? Who use this project / EXAMPLE PROJECT USE THIS LIBRARY


1. General Studio Developer App

General Studio Developer App Is Application code editor with cross platform support with extra feature native (SSH CLIENT, CHROOT LINUX, HTTP CLIENT, NETWORK PROXY) so this app is can help you to develop without use more one app so you will significant decrease ram usage
 
<img src="assets/general_studio_developer_development.png" height=100% width=100%>
<img src="assets/general_studio_developer_mobile_terminal.png" height=50% width=50%>

1. General Bot App / General Automation App
   

2. General Application


## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple 

```dart
// ignore_for_file: empty_catches, non_constant_identifier_names
import 'dart:convert';
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
  TerminalLibraryFlutterController terminalLibraryFlutterController = TerminalLibraryFlutterController();
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
      ptyLibrary.output.listen((event) {
        if (event.isNotEmpty) {
          try {
            terminalLibraryFlutter.write(utf8.decode(event, allowMalformed: true));
          } catch (e) {}
        }
      });
      terminalLibraryFlutter.onOutput = (String value) {
        if (value.isNotEmpty) {
          try {
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
      setState(() {});
    });
    setState(() {
      is_loading = false;
    });
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
```
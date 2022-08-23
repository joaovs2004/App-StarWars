import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:teste03_escribo/webview.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(
    const MaterialApp(
      title: "App Star Wars",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const TextButton(
          onPressed: null,
          child: Text("Site oficial"),
        ),
        actions: const [
          TextButton(
            onPressed: null,
            child: Text("Avatar"),
          )
        ],
      ),
      body: const MyWebView(),
    );
  }
}

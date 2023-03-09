import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:b0pass_mobile_plugin/b0pass_mobile_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _b0passMobilePlugin = B0passMobilePlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _b0passMobilePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            TextButton(
                onPressed: () async {
                  print("run...in.");
                  String? rs = await _b0passMobilePlugin.run();
                  print("run....");
                  setState(() {
                    _platformVersion = rs ?? "";
                  });
                },
                child: Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 30,
                )),
            TextButton(
                onPressed: () async {
                  print("stop...in.");
                  String? rs = await _b0passMobilePlugin.stop();
                  setState(() {
                    _platformVersion = 'stop: ${rs ?? ""}';
                  });
                  print("stop....");
                },
                child: Icon(
                  Icons.stop_circle,
                  color: Colors.red,
                  size: 30,
                )),
          ],
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}

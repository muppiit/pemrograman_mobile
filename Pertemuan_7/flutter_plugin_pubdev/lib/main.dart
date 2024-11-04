import 'package:flutter/material.dart';
import 'package:flutter_plugin_pubdev/red_text_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.yellowAccent,
                width: 50,
                child: const RedTextWidget(
                  text: 'You have pushed the button this many times:',
                ),
              ),
              Container(
                color: Colors.greenAccent,
                width: 100,
                child: const Text(
                  'You have pushed the button this many times:',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
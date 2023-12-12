import 'package:flutter/material.dart';
import 'package:praktikumpabflutter/page3.dart';
import 'package:praktikumpabflutter/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page3(),
    );
  }
}

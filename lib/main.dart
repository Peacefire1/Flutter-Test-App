import 'package:flutter/material.dart';
import 'package:movie/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      home: HomePage(),
    );
  }
}

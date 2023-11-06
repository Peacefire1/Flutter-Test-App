import 'package:flutter/material.dart';
import 'package:movie/global_key.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: MaterialApp(
        navigatorKey: GlobalKeys.navigatorKey,
        title: "Movie App",
        home: HomePage(),
      ),
    );
  }
}

import 'package:applify/pages/app_usage_screen.dart';
import 'package:applify/pages/home.dart';
import 'package:applify/pages/screen_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Applify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: <String, WidgetBuilder> {
        '/app_usage_screen': (BuildContext context) => const AppUsageScreen(),
        '/screen_state': (BuildContext context) => const ScreenState(),
      },
    );
  }
}

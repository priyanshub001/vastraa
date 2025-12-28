import 'package:flutter/material.dart';
import 'package:vastra/MainScreen.dart';
import 'package:vastra/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:AppTheme.light,
      darkTheme:AppTheme.dark,

      home: MainScreen(),



    );
  }
}


import 'package:flutter/material.dart';
import 'package:minimal_social_ap/pages/login_page.dart';
import 'package:minimal_social_ap/theme/dark_mode.dart';
import 'package:minimal_social_ap/theme/light_mode.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: lightMode,
      darkTheme: darkmode,
    );
  }
}

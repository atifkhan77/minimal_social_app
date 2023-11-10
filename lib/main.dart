import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/auth/auth.dart';
import 'package:minimal_social_ap/auth/login_or_register.dart';
import 'package:minimal_social_ap/firebase_options.dart';
import 'package:minimal_social_ap/pages/home_page.dart';
import 'package:minimal_social_ap/pages/profile_page.dart';
import 'package:minimal_social_ap/pages/users_page.dart';
import 'package:minimal_social_ap/theme/dark_mode.dart';
import 'package:minimal_social_ap/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkmode,
      routes: {
        './login_register_page': (context) => const LoginOrRegister(),
        './home_page': (context) => HomePage(),
        './profile_page': (context) => MyProfile(),
        './users_page': (context) => const UsersPage(),
      },
    );
  }
}

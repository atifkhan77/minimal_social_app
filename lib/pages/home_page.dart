import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home"),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
    );
  }
}

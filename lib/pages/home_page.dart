import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/components/my_drawer.dart';
import 'package:minimal_social_ap/components/text_fields.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController newPostController = TextEditingController();

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(child: Text("W A L L")),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          MyTextField(
              hintText: 'Say Something...',
              obsecureText: false,
              controller: newPostController),
        ],
      ),
    );
  }
}

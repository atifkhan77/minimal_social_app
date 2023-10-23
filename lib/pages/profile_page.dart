import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Profile"),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
    );
  }
}

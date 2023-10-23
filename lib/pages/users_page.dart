import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Users"),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
    );
    ;
  }
}

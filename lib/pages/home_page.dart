import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
<<<<<<< HEAD
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
=======
        backgroundColor: Colors.grey[600],
>>>>>>> 74b5a9b1837e6cb34bd0d80c08767d2d1db064d9
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
<<<<<<< HEAD
      drawer: Drawer(),
=======
>>>>>>> 74b5a9b1837e6cb34bd0d80c08767d2d1db064d9
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/helper/helper_function.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              DisplayMessegeToUser('Something Went Wrong', context);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // ignore: unnecessary_null_comparison
            if (snapshot.hasData == null) {
              return const Text("No Data");
            }
            final users = snapshot.data!.docs;
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 25),
                  child: Row(
                    children: [
                      BackButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user['username']),
                        subtitle: Text(user['email']),
                      );
                    },
                    itemCount: users.length,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

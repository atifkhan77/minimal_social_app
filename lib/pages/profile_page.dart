import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  //current user
  User? currentUser = FirebaseAuth.instance.currentUser;

  //future user detail
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: ((context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //error
            else if (snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            }
            //data recieve
            else if (snapshot.hasData) {
              Map<String, dynamic>? user = snapshot.data!.data();
              return Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50, left: 25),
                      child: Row(
                        children: [
                          BackButton(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(25),
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      user!['username'],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(user['email'],
                        style: TextStyle(
                          color: Colors.grey[600],
                        )),
                  ],
                ),
              );
            } else {
              return const Text('No Data');
            }
          }),
        ));
  }
}

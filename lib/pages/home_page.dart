import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_ap/components/my_drawer.dart';
import 'package:minimal_social_ap/components/my_list_tile.dart';
import 'package:minimal_social_ap/components/my_post_button.dart';
import 'package:minimal_social_ap/components/text_fields.dart';
import 'package:minimal_social_ap/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirestoreDatabase database = FirestoreDatabase();

  final TextEditingController newPostController = TextEditingController();

  void postMessege() {
    if (newPostController.text.isNotEmpty) {
      String messege = newPostController.text;
      database.addPost(messege);
    }
    newPostController.clear();
  }

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
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                      hintText: 'Say Something...',
                      obsecureText: false,
                      controller: newPostController),
                ),
                PostButton(onTap: postMessege)
              ],
            ),
          ),
          StreamBuilder(
            stream: database.getPostStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final posts = snapshot.data!.docs;
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No Posts .... Post Something!"),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      String messege = post['PostMessege'];
                      String userEmail = post['UserEmail'];
                      String timestamp = post['TimeStamp'];

                      return MyListTile(title: messege, subTitle: userEmail);
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}

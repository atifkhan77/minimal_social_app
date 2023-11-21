import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  Future<void> addPost(String messege) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessege': messege,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getPostStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return postsStream;
  }
}

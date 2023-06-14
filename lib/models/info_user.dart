import 'package:cloud_firestore/cloud_firestore.dart';

class InfoUser {
  String? uid, name, email, password;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$uid');

  InfoUser({
    required this.name,
    required this.email,
    required this.password,
  });

  InfoUser.fromDocument(DocumentSnapshot<Map<String, dynamic>> document)
      : name = document['name'],
        email = document['email'];

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}

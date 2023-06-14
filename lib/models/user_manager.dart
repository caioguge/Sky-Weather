import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_idea/models/info_user.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  InfoUser? appUser;
  bool get isLoggedIn => appUser != null;

  bool _loading = false;

  bool get loading => _loading;

  UserManager() {
    _loadCurrentUser();
  }

  Future<void> signUp({
    required InfoUser userApp,
    required Function failFunction,
    required Function sucessFunction,
  }) async {
    loading = true;
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: userApp.email!,
        password: userApp.password!,
      );
      if (credential.user == null) return;
      appUser = userApp;
      appUser!.uid = credential.user!.uid;
      userApp.saveData();

      sucessFunction();
    } on FirebaseAuthException catch (e) {
      failFunction(e);
    }
    loading = false;
  }

  Future<void> signIn({
    required InfoUser userApp,
    required Function failFunction,
    required Function sucessFunction,
  }) async {
    loading = true;

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: userApp.email!,
        password: userApp.password!,
      );
      await _loadCurrentUser();
      appUser?.uid = credential.user?.uid;

      sucessFunction();
    } on FirebaseAuthException catch (e) {
      failFunction(e);
    }
    loading = false;
  }

  void signOut() {
    _auth.signOut();
    appUser = null;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    _auth.authStateChanges().listen((User? user) async {
      if (user != null) {
        final docUser = await firestore.collection('users').doc(user.uid).get();
        appUser = InfoUser.fromDocument(docUser);

        notifyListeners();
      }
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/services/api_services.dart';

import '../../services/database_services.dart';
import 'user_model.dart' as u;

class UserRepo {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get userData {
    return _auth.userChanges();
  }

  u.User? _userFromFirebaseUser(
      QueryDocumentSnapshot<Map<String, dynamic>>? doc) {
    if (doc != null) {
      return u.User(
        uid: doc[0]['uid'],
        name: doc[0]['name'],
        email: doc[0]['email'],
      );
    }
    return null;
  }

  Future<u.User?> getUserData() async {
    // The user should be signed in to get his data
    if (_auth.currentUser != null) {
      final db = DataBaseServiecs(
        collectionPath: "users/${_auth.currentUser!.uid}",
      );

      // s stands for snapshot
      // take the first item because there is only one user in this path
      await db.read().then((s) => _userFromFirebaseUser(s.docs[0]));
    }
    return null;
  }

  Future setUserData(String name, String email) async {
    // To complete the user data the user must be signed in
    if (_auth.currentUser != null) {
      final db = DataBaseServiecs(
        collectionPath: "users/${_auth.currentUser!.uid}",
      );

      db.write({
        "uid": _auth.currentUser!.uid,
        "name": name,
        "email": email,
      });
    }
  }

  Future<ApiResponse> signUp(String name, String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      await setUserData(name, email);
      return ApiResponse.completed(null);
    } catch (e) {
      debugPrint("$e");
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> login(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return ApiResponse.completed(null);
    } catch (e) {
      debugPrint("$e");
      return ApiResponse.error(e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required name}) async {
    String res = 'email already in use';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          name.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(cred.user!.uid);

        //add user to database
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'photoUrl': ''
        });
        res = 'success';

        // alternative
        // await _firestore.collection('user').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'followers': [],
        //   'following': []
        // });

      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'invalid email';
      } else if (err.code == 'weak-password') {
        res = 'Weak password';
      }
    } catch (e) {
      res = e.toString();
      // print(res);
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Invalid email";
    try {
      if (email.isNotEmpty & password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Fill all the fields";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        res = 'No user found';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong password';
      }
    } catch (e) {
      res = e.toString();
      // print(res);
    }
    return res;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => auth.idTokenChanges();

  Future signInWithPhoneNumber(String phoneNumber) async {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (status) {
          debugPrint('verificationCompleted');
        },
        verificationFailed: (exception) {
          debugPrint('verificationFailed');
        },
        codeSent: (codeSent, code) {
          debugPrint('codeSent');
        },
        codeAutoRetrievalTimeout: (code) {});
  }
}

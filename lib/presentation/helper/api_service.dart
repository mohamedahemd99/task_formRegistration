import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<User> currentUser();
  Future<User> signIn(String email, String password);
  Future<User> createUser(String email, String password);
  Future<void> signOut();
  Future<void> updateEMail(String newEmail);
  Future<void> updatePhoto(String newUrlPhoto);
  Future<void> sendVerificationEmail();
  Future<void> sendPasswordResetEmail(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> signIn(String email, String password) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user!;
  }

  @override
  Future<User> createUser(String email, String password) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user!;
  }

//Get a user's edit_profile
  @override
  Future<User> currentUser() async {
    User? user = _firebaseAuth.currentUser;
    return user!;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> updateEMail(String newEmail) async {
    User user = await currentUser();
   await  user.updateEmail(newEmail);
  }

  @override
  Future<void> updatePhoto(String newUrlPhoto)async {
    User user = await currentUser();
    await user.updateEmail(newUrlPhoto);
  }

  @override
  Future<void> sendVerificationEmail()async {
     User user = await currentUser();
    await user.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(String email)async {
    await _firebaseAuth
    .sendPasswordResetEmail(email: email);
  }
}

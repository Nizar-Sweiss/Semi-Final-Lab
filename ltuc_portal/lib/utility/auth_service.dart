import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ltuc_portal/screens/screens.dart';
import 'package:ltuc_portal/utility/firebase_references.dart';

/// Creating a reference to the FirebaseAuth instance.
final auth = FirebaseAuth.instance;

class AuthService {
  /// This function takes a User object as a parameter, and returns a Future that completes when the
  /// user data has been updated.
  updateUserData(User user) async {
    DocumentReference document = users.doc(user.uid);
    return document.set(
      {
        "uid": user.uid,
        "email": user.email,
        "displayName": user.displayName ?? "test",
      },
    );
  }

  /// signs out the user
  signOut() {
    auth.signOut();
  }

  /// signs in with Google, gets the authentication, and then signs in with Firebase
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['email']).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  /// If the user is logged in, show the HomeScreen, otherwise show the LoginScreen
  handleAuthState() {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: snapshot.connectionState != ConnectionState.active
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : user != null
                  ? const HomeScreen()
                  : const LoginScreen(),
        );
      },
    );
  }
}

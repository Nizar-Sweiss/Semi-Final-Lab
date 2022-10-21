import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ltuc_portal/screens/screens.dart';
import 'package:ltuc_portal/utility/utility.dart';

/// Creating a reference to the FirebaseAuth instance.
final auth = FirebaseAuth.instance;

class AuthService {
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
          scaffoldMessengerKey: Utils.messengerKey,
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

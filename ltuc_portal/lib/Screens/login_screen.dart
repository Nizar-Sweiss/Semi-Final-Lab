import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltuc_portal/main.dart';
import 'package:ltuc_portal/widgets/widgets.dart';
import 'package:ltuc_portal/utility/firebase_references.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 204,
                child: Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.noteSticky,
                      color: Colors.yellow,
                      size: 50,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Portal",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 100),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    DefaultFormField(
                      textHint: "E-mail",
                      controller: emailController,
                    ),
                    DefaultFormField(
                      textHint: "Password",
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              DefaultButton(
                  label: "Login",
                  color: Colors.black,
                  width: 250,
                  onTap: signInAuth),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have account? ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "SignUp");
                    },
                    child: const Text(
                      "Sign-up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromARGB(255, 0, 68, 255),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  testa() {
    return print("On Tap Activated ");
  }

  Future signInAuth() async {
    print("signInAuth Working");

    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong...",
          ),
        ),
      );
    }
    //  navigatorKey.currentState!.popUntil((route)=>route)
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

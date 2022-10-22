import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ltuc_portal/widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var displayNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(222, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Material(
            elevation: 20,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text(
                            "Sign Up ",
                            style: TextStyle(fontSize: 30),
                          )),
                      DefaultFormField(
                        textHint: "Full name",
                        controller: displayNameController,
                      ),
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
                  label: "Sign Up",
                  onTap: signInAuth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
      ),
    );
  }

  Future signInAuth() async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      AuthService()
          .updateUserData(userCredential.user!, displayNameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Account Created Successfully ",
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Utils.errorSnackBar(e.message);
    } finally {
      Navigator.pop(context);
    }
  }
}

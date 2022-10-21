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
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      textHint: "User Name",
                      controller: userNameController,
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
              const SizedBox(height: 10),
            ],
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
      AuthService().updateUserData(userCredential.user!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Account Created Successfully ",
          ),
        ),
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong...",
          ),
        ),
      );
    } finally {
      Navigator.pop(context);
    }
  }
}

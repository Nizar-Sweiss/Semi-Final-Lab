import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ltuc_portal/Screens/screens.dart';
import 'package:ltuc_portal/Widgets/default_chiplogin.dart';
import 'package:ltuc_portal/Widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';

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
                      key: const Key("email_textfield"),
                      textHint: "E-mail",
                      controller: emailController,
                    ),
                    DefaultFormField(
                      key: const Key("pass_textfield"),
                      textHint: "Password",
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              DefaultButton(
                label: "Login",
                onTap: signInAuth,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                ),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: const Text("Or Sign in with "),
              ),
              GoogleButton(
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
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
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  DefaultChipLogIn(
                    key: const Key("clear_chip"),
                    email: "",
                    pass: "",
                    emailController: emailController,
                    passwordController: passwordController,
                    chipLabel: "Clear",
                  ),
                  DefaultChipLogIn(
                    key: const Key("test_chip"),
                    email: "test@test.com",
                    pass: "test1234",
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      Utils.errorSnackBar(e.message);
    } finally {
      Navigator.pop(context);
    }
  }
}

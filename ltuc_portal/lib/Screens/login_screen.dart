import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltuc_portal/widgets/widgets.dart';

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
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.noteSticky,
                    color: Colors.yellow,
                    size: 50,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Noty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "The number #1 tool for personal notes!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
            DefaultButton(label: "Login", onTap: () {}),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have account? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "SignUp");
                  },
                  child: const Text(
                    "Sign-up",
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

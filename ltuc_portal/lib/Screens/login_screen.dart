import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "SignUp");
                  },
                  child: const Text(
                    "Sign-up",
                    style: TextStyle(
                      color: Colors.blue,
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

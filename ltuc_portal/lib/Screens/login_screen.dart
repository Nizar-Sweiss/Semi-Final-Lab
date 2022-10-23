import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ltuc_portal/Screens/screens.dart';
import 'package:ltuc_portal/Widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';
import 'package:lottie/lottie.dart';

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //                 <--- border radius here
                          ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(children: [
                      Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_8pL7DHZXvo.json',
                          height: 200),
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
                      Container(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "forgot your password?",
                              style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 4, 3, 3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DefaultButton(
                        label: "Login",
                        onTap: signInAuth,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have account? ",
                            style: TextStyle(
                              fontSize: 15,
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
                                fontSize: 15,
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
                    ]),
                  ),
                ),
              ),
              Row(children: const [
                Expanded(
                    child: Divider(
                  color: Colors.black,
                  thickness: 1,
                )),
                Text("OR"),
                Expanded(
                    child: Divider(
                  thickness: 1,
                  color: Colors.black,
                )),
              ]),
              const SizedBox(height: 10),
              GoogleButton(
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
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

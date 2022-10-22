import 'package:flutter/material.dart';

class DefaultChipLogIn extends StatefulWidget {
  final String email;
  final String pass;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  String chipLabel;

  DefaultChipLogIn({
    super.key,
    required this.email,
    required this.pass,
    required this.emailController,
    required this.passwordController,
    this.chipLabel = "",
  }) {
    chipLabel = chipLabel.isEmpty ? email : chipLabel;
  }

  @override
  State<DefaultChipLogIn> createState() => _DefaultChipLogInState();
}

class _DefaultChipLogInState extends State<DefaultChipLogIn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Chip(
        label: Text(widget.chipLabel),
      ),
      onTap: () {
        widget.emailController.text = widget.email;
        widget.passwordController.text = widget.pass;
      },
    );
  }
}

import 'package:flutter/material.dart';

class EditDeleteButtons extends StatefulWidget {
  const EditDeleteButtons({super.key});

  @override
  State<EditDeleteButtons> createState() => _EditDeleteButtonsState();
}

class _EditDeleteButtonsState extends State<EditDeleteButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}

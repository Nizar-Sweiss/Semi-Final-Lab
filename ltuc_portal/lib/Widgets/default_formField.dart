import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required String textHint,
  required TextEditingController controller,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "hintText",
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required Function function,
  Color? color = Colors.blue,
  int? width = 200,
  int? height = 40,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => function,
      child: Text(
        text,
      ),
    );

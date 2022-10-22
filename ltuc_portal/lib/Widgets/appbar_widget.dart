import 'package:flutter/material.dart';
import 'package:ltuc_portal/utility/utility.dart';

// ignore: non_constant_identifier_names
AppBarWidget(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/LTUC_logo_black.png",
              height: 20,
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            auth.signOut();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

const white = Colors.white;
const black = Color.fromRGBO(48, 47, 48, 1.0);
const grey = Color.fromRGBO(141, 141, 141, 1.0);
const lightGrey = Color.fromRGBO(239, 243, 246, 1.0);
const lightBlue = Color.fromRGBO(213, 230, 249, 1.0);

List<Color> primaryColors = const [
  Color.fromRGBO(49, 154, 159, 1),
  Color.fromRGBO(49, 94, 159, 1),
  Color.fromRGBO(173, 42, 122, 1),
];

List<Color> secondaryColors = const [
  Color.fromRGBO(233, 245, 246, 1),
  Color.fromRGBO(235, 240, 247, 1),
  Color.fromRGBO(249, 234, 243, 1),
];

const TextTheme defaultTextTheme = TextTheme(
  headline1: TextStyle(
    color: black,
    fontWeight: FontWeight.w700,
    fontSize: 19,
  ),
  headline2: TextStyle(
    color: black,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  ),
  bodyText1: TextStyle(
    color: black,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.fade,
    fontSize: 20,
    height: 1.5,
  ),
  bodyText2: TextStyle(
    color: black,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 1.5,
  ),
  subtitle1: TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
  subtitle2: TextStyle(
    color: grey,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
);

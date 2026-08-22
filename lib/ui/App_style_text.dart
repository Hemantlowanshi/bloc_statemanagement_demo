import 'package:flutter/material.dart';
class AppText{

  static Text medium(
      String text, {
        double fontSize = 14,
        Color color = Colors.black,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Text regular(
      String text, {
        double fontSize = 14,
        Color color = Colors.black,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  static Text semiBold(
      String text, {
        double fontSize = 14,
        Color color = Colors.black,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text bold(
      String text, {
        double fontSize = 14,
        Color color = Colors.black,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }


}

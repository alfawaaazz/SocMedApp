import 'package:flutter/material.dart';

InputDecoration defaultDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 0.8,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}

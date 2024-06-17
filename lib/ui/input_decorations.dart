import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          //color: Colors.deepPurple,
          color: Color.fromRGBO(0, 0, 0, 1)
        )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(28, 83, 209, 1),
          width: 2
        )
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.black
      ),
      prefixIcon: prefixIcon != null 
        ? Icon(prefixIcon, color: Color.fromARGB(255, 2, 2, 24))
        : null
    );
  }

}
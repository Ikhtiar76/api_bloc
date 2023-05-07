import 'package:flutter/material.dart';

Widget myTextfield({String? title, String? hint, icon, Widget? button}) {
  return Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.grey,
            ),
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            prefixIcon: icon,
            suffixIcon: button),
      ),
    ],
  );
}

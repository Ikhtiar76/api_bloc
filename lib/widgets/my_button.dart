import 'package:flutter/material.dart';

Widget myButton({
  String? title,
  color,
  textColor,
  onPressed,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPressed,
    child: Text(
      title.toString(),
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

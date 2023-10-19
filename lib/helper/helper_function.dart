import 'package:flutter/material.dart';

void DisplayMessegeToUser(String messege, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(messege),
    ),
  );
}

import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const MyTextBox({
    required this.controller,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        onTap: () {},
        controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.white,
          labelText: text,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 14.0, horizontal: 12.0), // Adjust the padding as needed
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue.shade400),
          ),
        ),
      ),
    );
  }
}

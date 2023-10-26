import "package:flutter/material.dart";

class MyFormField extends StatelessWidget {
  final controller;
  final String labelText;
  final bool hideText;

  const MyFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hideText});

  @override
  Widget build(BuildContext context) {

    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.90,
      child: TextField(
        controller: controller,
        obscureText: hideText,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
          )
        ),
      ),
    );
  }
}

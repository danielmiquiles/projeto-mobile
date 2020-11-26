import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double padding;
  final bool hidden;
  final TextInputType teclado;

  CustomTextField({
    @required this.label,
    @required this.controller,
    this.padding = 8.0,
    this.hidden = false,
    this.teclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: TextField(
        keyboardType: teclado,
        obscureText: hidden,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}

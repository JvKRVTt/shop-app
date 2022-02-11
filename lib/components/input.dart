import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String name;
  final String? helperText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool obscureText;

  const Input(this.name, {Key? key, this.keyboardType, this.controller, this.inputFormatters, this.helperText, this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: name,
        enabledBorder: _border(const Color(0xffEFEFEF)),
        focusedBorder: _border(const Color(0xff3766DF)),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.red)
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color)
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не должно быть пустым';
    }

    return null;
  }
}
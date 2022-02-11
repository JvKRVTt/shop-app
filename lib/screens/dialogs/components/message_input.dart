import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const MessageInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: _border(),
        focusedBorder: _border(),
        filled: true,
        hintText: 'Введите сообщение',
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: Colors.transparent)
    );
  }
}
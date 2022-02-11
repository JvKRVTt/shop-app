import 'package:flutter/material.dart';
import 'package:shop/models/message.dart';

class MessageBlock extends StatelessWidget {
  final Message message;
  final String companyName;

  const MessageBlock(this.message, this.companyName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(16);
    var textColor = message.fromUser ? Colors.white : Colors.black;

    return Container(
      margin: message.fromUser ? const EdgeInsets.only(left: 36, bottom: 16) : const EdgeInsets.only(right: 36, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: message.fromUser ? const Color(0xff3766DF) : const Color(0xffF9F9F9),
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius, bottomLeft: radius, bottomRight: radius)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.fromUser ? 'Вы' : companyName, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor
          )),
          const SizedBox(height: 8),
          Text(message.text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/dialog.dart' as model;

class Chat extends StatelessWidget {
  final model.Dialog dialog;

  const Chat(this.dialog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var createdAt = DateFormat.Hm().format(dialog.lastMessage.createdAt);

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/chat', arguments: dialog);
      },
      title: Text(dialog.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(dialog.lastMessage.text, style: const TextStyle(fontSize: 15)),
      ),
      trailing: Text(createdAt),
    );
  }
}
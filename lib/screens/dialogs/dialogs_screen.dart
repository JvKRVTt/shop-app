import 'package:flutter/material.dart';
import 'package:shop/api/api.dart';
import 'package:shop/components/dummy_block.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/dialog.dart' as model;
import 'package:shop/screens/dialogs/components/chat.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({Key? key}) : super(key: key);

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
  List<model.Dialog> dialogs = [];

  @override
  void initState() {
    super.initState();
    _getDialogs();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      appBar: AppBar(title: const Text('Сообщения'),),
      child: dialogs.isNotEmpty ? ListView(
        children: _dialogs(),
      ) : const DummyBlock(text: 'У вас нет сообщений', image: 'chat'),
    );
  }

  void _getDialogs() async {
    dialogs = await API.getDialogs();
    setState(() {});
  }

  List<Widget> _dialogs() {
    List<Widget> elements = [];

    dialogs.forEach((dialog) {
      elements.add(Chat(dialog));
      elements.add(const Divider());
    });

    return elements;
  }
}
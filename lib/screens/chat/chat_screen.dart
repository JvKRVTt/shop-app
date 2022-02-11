import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/api/api.dart';
import 'package:shop/components/input.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/dialog.dart' as model;
import 'package:shop/models/message.dart';
import 'package:shop/screens/chat/components/message_block.dart';
import 'package:shop/screens/dialogs/components/message_input.dart';
import 'package:shop/variables.dart';

class ChatScreen extends StatefulWidget {
  final model.Dialog dialog;

  const ChatScreen(this.dialog, {Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Color? _sendButtonColor;

  @override
  void initState() {
    super.initState();
    _getMessages();
    _messageController.addListener(_controllerListener);

    FirebaseDatabase.instance.ref('messages/${prefs.getInt('id')}').onValue.listen((event) {
      print('Hello World');
      _getMessages();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      showBottomBar: false,
      appBar: AppBar(
        title: Text(widget.dialog.name),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index){
                return MessageBlock(_messages.reversed.toList()[index], widget.dialog.name);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MessageInput(controller: _messageController),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _sendMessage,
                child: SvgPicture.asset('assets/icons/send.svg', color: _sendButtonColor),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _getMessages() async {
    _messages = await API.getMessages(widget.dialog.id);
    setState(() {});
    _scroll();
  }

  void _controllerListener() {
    setState(() {
      _sendButtonColor = _messageController.text.isNotEmpty ? const Color(0xff3766DF) : null;
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      dio.post('/messages', data: {
        'company_id': widget.dialog.id,
        'text': _messageController.text
      });

      setState(() {
        _messages.add(Message(true, _messageController.text, DateTime.now()));
        _messageController.text = '';
      });
      _scroll();
    }
  }
  
  void _scroll() {
    _scrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(microseconds: 300)
    );
  }
}

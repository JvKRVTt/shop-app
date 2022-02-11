import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloseProductCardButton extends StatelessWidget {
  const CloseProductCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: double.infinity,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Color(0xffABABAB), size: 32,),
      ),
    );
  }
}
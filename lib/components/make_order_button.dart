import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      alignment: Alignment.bottomCenter,
      child: Button(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Сделать заказ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 4),
              Icon(CupertinoIcons.arrow_right)
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/categories');
          }
      ),
    );
  }
}
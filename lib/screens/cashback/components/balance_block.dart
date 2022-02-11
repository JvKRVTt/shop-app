import 'package:flutter/material.dart';

class BalanceBlock extends StatelessWidget {
  final double balance;

  const BalanceBlock(this.balance, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF9F9F9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            child: Text('$balance', style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            visible: balance > 0,
          ),
          SizedBox(height: balance > 0 ? 16 : 0,),
          Text(balance > 0 ? 'Бонусов на счету' : 'У вас пока нет бонусов', style: const TextStyle(
            fontSize: 14,
            color: Color(0xffBDBDBD)
          ),)
        ],
      ),
    );
  }
}
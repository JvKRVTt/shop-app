import 'package:flutter/material.dart';
import 'package:shop/components/dummy_block.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/screens/cashback/components/balance_block.dart';

class CashbackScreen extends StatelessWidget {
  const CashbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      appBar: AppBar(
        title: const Text('Кэшбек'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          BalanceBlock(0),
          SizedBox(height: 24,),
          Text('История', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Visibility(
                child: DummyBlock(text: 'Тут будет история транзакций вашего кэшбека', image: 'cashback',),
                visible: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
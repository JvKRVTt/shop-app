import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order.dart';

class OrderCard extends StatelessWidget {
  final double radius = 10;
  final Order order;

  const OrderCard(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var status = '';
    var color = Colors.white;
    var createdAt = DateFormat('dd.MM.yyyy').format(order.createdAt);

    switch (order.status) {
      case 'waiting':
        status = 'В обработке';
        color = const Color(0xff036ED1);
        break;
      case 'confirmed':
        status = 'Подтверждён';
        color = const Color(0xff14D103);
        break;
      case 'rejected':
        status = 'Отклонён';
        color = const Color(0xffE63939);
        break;
    }

    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(radius)
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(radius))
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text('Заказ №${order.id} | $createdAt', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Статус заказа: ', style: TextStyle(fontSize: 14, color: Color(0xff8C8C8C))),
                  Text(status, style: const TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
          const Spacer(),
          const Icon(CupertinoIcons.chevron_right),
          const SizedBox(width: 12)
        ],
      ),
    );
  }
}

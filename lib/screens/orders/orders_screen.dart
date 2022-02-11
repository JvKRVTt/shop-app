import 'package:flutter/material.dart';
import 'package:shop/api/api.dart';
import 'package:shop/components/button.dart';
import 'package:shop/components/dummy_block.dart';
import 'package:shop/components/make_order_button.dart';
import 'package:shop/components/order_card.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool loading = false;
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      appBar: AppBar(title: const Text('Мои заказы')),
      child: Visibility(
        child: orders.isNotEmpty ? Column(
          children: _orders(),
        ) : const DummyBlock(text: 'У вас нет заказов', image: 'orders', showButton: true),
        visible: !loading,
      ),
    );
  }

  Future<void> _getOrders() async {
    setState(() {
      loading = true;
    });
    orders = await API.getOrders();
    setState(() {
      loading = false;
    });
  }

  List<Widget> _orders() {
    List<Widget> elements = [];

    orders.forEach((order) {
      elements.add(OrderCard(order));
      elements.add(SizedBox(height: 8,));
    });

    return elements;
  }
}
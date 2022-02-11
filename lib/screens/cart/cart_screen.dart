import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/button.dart';
import 'package:shop/components/dummy_block.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/screens/cart/components/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      appBar: AppBar(title: const Text('Корзина'), actions: [
        Visibility(
          child: IconButton(onPressed: () {
            Provider.of<CartModel>(context, listen: false).clear();
          }, icon: const Icon(CupertinoIcons.trash, color: Colors.red)),
          visible: Provider.of<CartModel>(context).count > 0,
        )
      ],),
      child: Provider.of<CartModel>(context).count > 0 ? Column(
        children: _items(),
      ) : const DummyBlock(text: 'Корзина пустая', image: 'cart', showButton: true,),
    );
  }

  List<Widget> _items() {
    List<Widget> elements = [];
    var items = Provider.of<CartModel>(context).uniqueItems;

    elements.add(Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 8),
            CartItem(items[index]),
            const SizedBox(height: 8),
            const Divider()
          ],
        );
      }, itemCount: items.length, shrinkWrap: true),
    ));
    // Provider.of<CartModel>(context).uniqueItems.forEach((product) {
    // });

    elements.add(SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          const Text('Итого', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text('${Provider.of<CartModel>(context).getTotal()}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
        ],
      ),
    ));
    elements.add(const SizedBox(height: 10,));
    elements.add(Button('Перейти к оформлению', onPressed: () {
      Navigator.pushNamed(context, '/order');
    }));
    elements.add(const SizedBox(height: 24,));
    return elements;
  }
}
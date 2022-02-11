import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(product.image, width: 80, height: 80,),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.minus, size: 32 * 0.6),
                    onPressed: () {
                      cart.remove(product.id);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Text("${cart.getQuantity(product.id)}"),
                const SizedBox(width: 16),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.plus, size: 32 * 0.6,),
                    onPressed: () {
                      cart.add(product.id);
                    },
                  ),
                ),
                const SizedBox(width: 80),
                const Text('1234,00', style: TextStyle(
                  color: Color(0xffBDBDBD)
                ),),
              ],
            )
          ],
        )
      ],
    );
  }
}
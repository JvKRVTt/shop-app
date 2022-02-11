import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shop/components/button.dart';
import 'package:shop/models/cart.dart';

class AddToCartButton extends StatefulWidget {
  final int productId;

  const AddToCartButton(this.productId, {Key? key}) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  late CartModel cart;
  
  @override
  Widget build(BuildContext context) {
    cart = context.read<CartModel>();
    return Provider.of<CartModel>(context).isInCart(widget.productId) ? _inCart() : _notInCart();
  }

  Widget _inCart() {
    var quantity = Provider.of<CartModel>(context).getQuantity(widget.productId);

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          _button(false),
          Text('$quantity'),
          _button(true),
        ],
      ),
    );
  }

  Widget _notInCart() {
    return Button(
      const Text('В корзину', style: TextStyle(
        color: Colors.black,
      ),),
      onPressed: () {
        cart.add(widget.productId);
      },
      color: const Color(0xffF9F9F9),
      height: 32,
    );
  }
  
  Widget _button(bool isAdd) {
    return CircleAvatar(
      backgroundColor: const Color(0xffF9F9F9),
      child: IconButton(
        icon: Icon(isAdd ? CupertinoIcons.plus : CupertinoIcons.minus, color: Colors.black,),
        onPressed: () {
          isAdd ? cart.add(widget.productId) : cart.remove(widget.productId);
        },
      ),
    );
  }
}
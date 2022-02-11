import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/src/provider.dart';
import 'package:shop/components/button.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/catalog/components/add_to_cart.dart';
import 'package:shop/screens/catalog/components/close_button.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.product.image, height: 106, width: double.infinity,),
              Text('${widget.product.title}, ${widget.product.weight} г'),
              const Spacer(),
              Text('${widget.product.price} тг.', style: const TextStyle(
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 16,),
              AddToCartButton(widget.product.id)
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 15, bottom: 24, left: 16, right: 16),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CloseProductCardButton(),
              Image.network(widget.product.image, height: 180,),
              const SizedBox(height: 16),
              Text('${widget.product.title}, ${widget.product.weight} г', style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20
              ),),
              const SizedBox(height: 16),
              Text(widget.product.description),
              const SizedBox(height: 16),
              // Text('Страна: Казахстан', style: TextStyle(
              //     color: Color(0xffBDBDBD),
              // ),),
              const SizedBox(height: 24),
              Button('В корзину • ${widget.product.price} тг.', onPressed: () {
                var cart = context.read<CartModel>();
                cart.add(widget.product.id);
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
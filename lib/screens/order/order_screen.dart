import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/button.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/address.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:shop/variables.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Address address = addresses.first;
  String paymentMethod = 'Наличными';
  
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      showBottomBar: false,
      appBar: AppBar(
        title: const Text('Оформление заказа'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text('Адрес доставки', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600
          )),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(16)
            ),
            child: DropdownButtonFormField<Address>(
              value: address,
              icon: const Icon(CupertinoIcons.chevron_down, size: 17,),
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onChanged: (Address? newValue) {
                setState(() {
                  address = newValue!;
                });
              },
              items: addresses
                  .map<DropdownMenuItem<Address>>((Address value) {
                return DropdownMenuItem<Address>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Способ оплаты', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
          )),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: BorderRadius.circular(16)
            ),
            child: DropdownButtonFormField<String>(
              value: paymentMethod,
              icon: const Icon(CupertinoIcons.chevron_down, size: 17,),
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  paymentMethod = newValue!;
                });
              },
              items: <String>['Наличными', 'Безналичными', 'Kaspi Pay']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Text('Итого', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text('${Provider.of<CartModel>(context).getTotal()}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          const Spacer(),
          Button('Оформить', onPressed: _order),
          const SizedBox(height: 42),
        ],
      ),
    );
  }

  Future<void> _order() async {
    var cart = context.read<CartModel>();
    Map<String, dynamic> data = {};

    cart.uniqueItems.forEach((product) {
      data["${product.id}"] = "${cart.getQuantity(product.id)}";
    });

    FormData formData = FormData.fromMap({
      'delivery_address': address.name,
      'payment_method': paymentMethod,
      'order': data
    });

    var response = await dio.post('/orders', data: formData);

    var order = Order.fromJson(response.data['data']);

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
              Text('Заказ №${order.id} оформлен!', style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22
              )),
              const SizedBox(height: 5),
              const Text('Ваш заказ оформлен, ожидайте его принятия администратором', style: TextStyle(
                  fontSize: 17,
                  color: Color(0xffBDBDBD)
              )),
              const SizedBox(height: 24),
              Button('Понятно', onPressed: () {
                Phoenix.rebirth(context);
              })
            ],
          ),
        ),
      )
    );
  }
}
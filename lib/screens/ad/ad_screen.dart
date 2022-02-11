import 'package:flutter/material.dart';
import 'package:shop/components/button.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/helper.dart';
import 'package:shop/models/ad.dart';
import 'package:shop/screens/ad/components/back_button.dart';

class AdScreen extends StatelessWidget {
  const AdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Ad ad = ModalRoute.of(context)!.settings.arguments as Ad;

    return Wrapper(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Stack(
            children: [
              Image.network(
                ad.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 16),
                child: AdBackButton(),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 170),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ad.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 24),
                  Text(ad.text, style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xffBDBDBD)
                  ),),
                  const SizedBox(height: 24),
                  Button('Вернуться на главную', onPressed: () => back(context))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
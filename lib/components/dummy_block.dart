import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'make_order_button.dart';

class DummyBlock extends StatelessWidget {
  final String text;
  final String image;
  final bool showButton;

  const DummyBlock({Key? key, required this.text, required this.image, this.showButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/dummy/$image.svg'),
              const SizedBox(height: 16),
              Text(text, style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffBDBDBD)
              ),)
            ],
          ),
        ),

        Visibility(
          child: const MakeOrderButton(),
          visible: showButton,
        )
      ],
    );
  }
}
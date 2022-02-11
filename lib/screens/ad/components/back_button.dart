import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helper.dart';

class AdBackButton extends StatefulWidget {
  const AdBackButton({Key? key}) : super(key: key);

  @override
  State<AdBackButton> createState() => _AdBackButtonState();
}

class _AdBackButtonState extends State<AdBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12)
      ),
      child: IconButton(
        icon: const Icon(CupertinoIcons.arrow_left, color: Color(0xff3766DF)),
        onPressed: () => back(context),
        color: Colors.red,
      ),
    );
  }
}
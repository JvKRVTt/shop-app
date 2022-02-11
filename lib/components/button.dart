import 'package:flutter/material.dart';

const buttonColor = Color(0xff3766DF);

class Button extends StatelessWidget {
  final dynamic text;
  final Function()? onPressed;
  final Color color;
  final double width;
  final double height;

  const Button(this.text, {Key? key, required this.onPressed, this.color = buttonColor, this.width = double.infinity, this.height = 56}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = text is String ? Text(text) : text;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
        child: child,
      ),
    );
  }
}
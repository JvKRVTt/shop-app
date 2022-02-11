import 'package:flutter/material.dart';
import 'package:shop/models/ad.dart';

class AdBlock extends StatefulWidget {
  final Ad ad;

  const AdBlock(this.ad, {Key? key}) : super(key: key);

  @override
  State<AdBlock> createState() => _AdBlockState();
}

class _AdBlockState extends State<AdBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 120,
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: NetworkImage(widget.ad.image),
                  fit: BoxFit.cover
              )
          ),
        ),
      ),
    );
  }

  void _onTap() {
    Navigator.pushNamed(context, '/ad', arguments: widget.ad);
  }
}
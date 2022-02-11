import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String image;

  const CategoryCard(this.image, {Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Image.asset(widget.image, fit: BoxFit.fill),
    );
  }

  void _onTap() {
    Navigator.pushNamed(context, '/categories');
  }
}
import 'package:flutter/material.dart';
import 'package:shop/models/category.dart';

class CategoryDropDownButton extends StatefulWidget {
  final Category category;

  const CategoryDropDownButton(this.category, {Key? key}) : super(key: key);

  @override
  State<CategoryDropDownButton> createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.category.name, style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                  ),),
                  const Spacer(),
                  Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
              Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _categories(),
                ),
                visible: isOpen,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSubcategory() {
    Navigator.pushNamed(context, '/catalog', arguments: widget.category);
  }

  Widget _category(String name) {
    return GestureDetector(
      child: Text(
        name,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: _onTapSubcategory,
    );
  }

  List<Widget> _categories() {
    var elements = <Widget>[];

    widget.category.subcategories.forEach((element) {
      elements.add(const SizedBox(height: 24));
      elements.add(_category(element.name));
    });

    return elements;
  }
}
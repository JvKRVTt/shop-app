import 'package:flutter/material.dart';
import 'package:shop/api/api.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/category.dart';
import 'package:shop/screens/categories/components/category_dropdown_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: EdgeInsets.zero,
      appBar: AppBar(title: const Text('Весь ассортимент'),),
      child: SingleChildScrollView(
        child: Column(
          children: _categories(),
        ),
      ),
    );
  }

  List<Widget> _categories() {
    var elements = <Widget>[];

    categories.forEach((element) {
      elements.add(const SizedBox(height: 8));
      elements.add(Padding(
        padding: wrapperPadding,
        child: CategoryDropDownButton(element),
      ));
    });

    return elements;
  }

  Future<void> _init() async {
    categories = await API.getCategories();
    setState(() {});
  }
}
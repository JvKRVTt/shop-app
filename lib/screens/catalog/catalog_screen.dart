import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/catalog.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/catalog/components/product_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Category? category;

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as Category;

    return Wrapper(
      appBar: AppBar(title: Text(category!.name)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _categories(),
        ),
      ),
    );
  }

  List<Widget> _categories() {
    List<Widget> elements = [];

    category!.subcategories.forEach((element) {
      var products = context.select<CatalogModel, List<Product>>(
        (catalog) => catalog.getBySubcategory(element.id),
      );

      elements.add(const SizedBox(height: 20));
      elements.add(Text(element.name, style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500
      )));
      elements.add(const SizedBox(height: 20));
      elements.add(GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: _products(products),
      ));
    });

    return elements;
  }

  List<Widget> _products(List<Product> products) {
    List<Widget> elements = [];

    products.forEach((element) {
      elements.add(ProductCard(element));
    });

    return elements;
  }
}
import 'package:shop/models/product.dart';

import '../variables.dart';

class CatalogModel {
  static List<Product> _products = allProducts;

  Product getById(int id) => _products.where((element) => element.id == id).first;

  List<Product> getBySubcategory(int subcategoryId) {
    return _products.where((element) => element.subcategories.contains(subcategoryId)).toList();
  }
}
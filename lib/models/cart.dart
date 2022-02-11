import 'package:flutter/material.dart';
import 'package:shop/models/catalog.dart';
import 'package:shop/models/product.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  final List<int> _productIds = [];

  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Product> get items => _productIds.map((id) => _catalog.getById(id)).toList();
  List<Product> get uniqueItems => _productIds.toSet().map((id) => _catalog.getById(id)).toList();
  int get count => _productIds.length;

  double getTotal() {
    double total = 0;

    items.forEach((element) {
      total += element.price;
    });

    return total;
  }

  bool isInCart(int productId) {
    return _productIds.contains(productId);
  }

  int getQuantity(int productId) {
    return _productIds.where((element) => element == productId).length;
  }

  void remove(int productId) {
    _productIds.remove(productId);
    notifyListeners();
  }

  void add(int productId) {
    _productIds.add(productId);
    notifyListeners();
  }

  void clear() {
    _productIds.clear();
    notifyListeners();
  }
}
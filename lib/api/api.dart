import 'package:shop/models/ad.dart';
import 'package:shop/models/address.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/dialog.dart';
import 'package:shop/models/message.dart';
import 'package:shop/models/order.dart';
import 'package:shop/models/product.dart';
import 'package:shop/variables.dart';

class API {
  static Future<List<Ad>> getAds() async {
    var response = await dio.get('/ads');

    List<Ad> list =
        (response.data['data'] as List).map((e) => Ad.fromJson(e)).toList();

    return list;
  }

  static Future<List<Category>> getCategories() async {
    var response = await dio.get('/categories');

    List<Category> list = (response.data['data'] as List)
        .map((e) => Category.fromJson(e))
        .toList();

    return list;
  }

  static Future<List<Product>> getProducts() async {
    var response = await dio.get('/products');

    List<Product> list = (response.data['data'] as List)
        .map((e) => Product.fromJson(e))
        .toList();

    return list;
  }

  static Future<List<Address>> getAddresses() async {
    var response = await dio.get('/addresses');

    List<Address> list = (response.data['data'] as List)
        .map((e) => Address.fromJson(e))
        .toList();

    return list;
  }

  static Future<List<Order>> getOrders() async {
    var response = await dio.get('/orders');

    List<Order> list = (response.data['data'] as List)
        .map((e) => Order.fromJson(e))
        .toList();

    return list;
  }

  static Future<List<Dialog>> getDialogs() async {
    var response = await dio.get('/messages');

    List<Dialog> list = (response.data['data'] as List)
        .map((e) => Dialog.fromJson(e))
        .toList();

    return list;
  }

  static Future<List<Message>> getMessages(int companyId) async {
    var response = await dio.get('/messages/$companyId');

    List<Message> list = (response.data['data'] as List)
        .map((e) => Message.fromJson(e))
        .toList();

    return list;
  }
}

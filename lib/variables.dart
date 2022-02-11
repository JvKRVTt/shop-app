import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/models/address.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/cart/cart_screen.dart';
import 'package:shop/screens/cashback/cashback_screen.dart';
import 'package:shop/screens/dialogs/dialogs_screen.dart';
import 'package:shop/screens/main/main_screen.dart';
import 'package:shop/screens/orders/orders_screen.dart';

// const String apiUrl = 'http://10.0.2.2:8000/api';
const String apiUrl = 'https://d07c-178-155-5-77.ngrok.io/api';
const bottomNavigation = {
  'Главная': MainScreen(),
  'Кэшбек': CashbackScreen(),
  'Мои заказы': OrdersScreen(),
  'Чат': DialogsScreen(),
  'Корзина': CartScreen(),
};

int selectedIndex = 0;

late SharedPreferences prefs;
Dio dio = Dio();
List<Product> allProducts = [];
List<Address> addresses = [];

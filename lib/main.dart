import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/api/api.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/catalog.dart';
import 'package:shop/models/dialog.dart' as model;
import 'package:shop/screens/ad/ad_screen.dart';
import 'package:shop/screens/cart/cart_screen.dart';
import 'package:shop/screens/cashback/cashback_screen.dart';
import 'package:shop/screens/catalog/catalog_screen.dart';
import 'package:shop/screens/categories/categories_screen.dart';
import 'package:shop/screens/chat/chat_screen.dart';
import 'package:shop/screens/login/login_screen.dart';
import 'package:shop/screens/main/main_screen.dart';
import 'package:shop/screens/order/order_screen.dart';
import 'package:shop/screens/orders/orders_screen.dart';
import 'package:shop/variables.dart';

void main() {
  runApp(Phoenix(
    child: const MyAppInit(),
  ));
}

class MyAppInit extends StatelessWidget {
  const MyAppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(context),
      builder: _futureBuilder,
    );
  }

  Future<bool> _init(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    dio.options.baseUrl = apiUrl;
    dio.options.headers['accept'] = 'application/json';

    if (prefs.containsKey('token')) {
      dio.options.headers['authorization'] = "Bearer ${prefs.getString("token")}";
      allProducts = await API.getProducts();
      addresses = await API.getAddresses();
      await Firebase.initializeApp();
    }
    return true;
  }

  Widget _futureBuilder(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasData) {
      return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            },
          )
        ],
        child: const MyApp(),
      );
    }

    return Container();
  }
}

class MyApp extends StatefulWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(0xff3766DF)
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: Scaffold(
        body: prefs.containsKey('token') ? const MainScreen() : const LoginScreen(),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
        '/ad': (context) => const AdScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/cashback': (context) => const CashbackScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/cart': (context) => const CartScreen(),
        '/order': (context) => const OrderScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/chat') {
          return MaterialPageRoute(
            builder: (context) {
              return ChatScreen(settings.arguments as model.Dialog);
            },
          );
        }
      },
    );
  }
}

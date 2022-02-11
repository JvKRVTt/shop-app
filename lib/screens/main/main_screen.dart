import 'package:flutter/material.dart';
import 'package:shop/api/api.dart';
import 'package:shop/components/order_card.dart';
import 'package:shop/components/wrapper.dart';
import 'package:shop/models/ad.dart';
import 'package:shop/screens/main/components/ad_block.dart';
import 'package:shop/screens/main/components/category_card.dart';
import 'package:shop/variables.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Ad> ads = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: EdgeInsets.zero,
      backgroundColor: const Color(0xff6588E5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 20, bottom: 38),
                itemCount: ads.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdBlock(ads[index]);
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                color: Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: wrapperPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 24),
                      // const OrderCard(),
                      const SizedBox(height: 24),
                      const Text('Новый заказ', style: TextStyle(fontSize: 24)),
                      const SizedBox(height: 24),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 23,
                        mainAxisSpacing: 23,
                        children: const [
                          CategoryCard('assets/images/card1.png'),
                          CategoryCard('assets/images/card2.png'),
                          CategoryCard('assets/images/card3.png'),
                          CategoryCard('assets/images/card4.png'),
                          CategoryCard('assets/images/card5.png'),
                          CategoryCard('assets/images/card6.png'),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _init() async {
    ads = await API.getAds();
    setState(() {});
  }
}
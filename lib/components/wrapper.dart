import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../variables.dart';

const wrapperPadding = EdgeInsets.symmetric(horizontal: 16);

class Wrapper extends StatefulWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final bool showBottomBar;

  const Wrapper({Key? key, this.appBar, required this.child, this.padding = wrapperPadding, this.backgroundColor, this.showBottomBar = true}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: widget.showBottomBar,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomNavigationBarItems(selectedIndex),
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff3766DF),
          unselectedFontSize: 12,
          selectedFontSize: 12,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) {
                  var key = bottomNavigation.keys.toList()[selectedIndex];
                  return bottomNavigation[key]!;
                },
                transitionDuration: Duration.zero
              ));
            });
          },
        ),
      ),
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar,
      body: SafeArea(
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems(int currentIndex) {
    var items = <BottomNavigationBarItem>[];

    var i = 0;
    bottomNavigation.forEach((key, value) {
      items.add(BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/icons/bottom_menu/$i.svg', width: 24, height: 24, color: currentIndex == i ? const Color(0xff3766DF) : const Color(0xff878787),),
        label: key,
      ));
      i++;
    });

    return items;
  }
}
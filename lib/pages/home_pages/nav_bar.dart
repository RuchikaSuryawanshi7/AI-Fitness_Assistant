import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key, required this.screens}) : super(key: key);

  final List<Widget> screens;

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late PersistentTabController _controller;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: Color(0xFFAD51A5),
        ),
        inactiveIcon: Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(
          0xFFAD51A5,
        ),
        activeColorSecondary: Color(
          0xFFAD51A5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.fitness_center_outlined,
          color: Color(0xFFAD51A5),
        ),
        inactiveIcon: Icon(
          Icons.fitness_center_outlined,
          color: Colors.white,
        ),
        title: ("Exercise"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(
          0xFFAD51A5,
        ),
        activeColorSecondary: Color(
          0xFFAD51A5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.chat_outlined,
          color: Color(0xFFAD51A5),
        ),
        inactiveIcon: Icon(
          Icons.chat_outlined,
          color: Colors.white,
        ),
        title: ("Chatbot"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(
          0xFFAD51A5,
        ),
        activeColorSecondary: Color(
          0xFFAD51A5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.menu_book_outlined,
          color: Color(0xFFAD51A5),
        ),
        inactiveIcon: Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
        ),
        title: ("Diet"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(
          0xFFAD51A5,
        ),
        activeColorSecondary: Color(
          0xFFAD51A5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_outline,
          color: Color(0xFFAD51A5),
        ),
        inactiveIcon: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(
          0xFFAD51A5,
        ),
        activeColorSecondary: Color(
          0xFFAD51A5,
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: widget.screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFF5C54E2),
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }
}

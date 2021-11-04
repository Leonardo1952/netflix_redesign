import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/pages/dashboard.dart';
import 'package:netflix_redesign/pages/my_movies.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CusBottomBar extends StatefulWidget {
  const CusBottomBar({Key? key}) : super(key: key);

  @override
  State<CusBottomBar> createState() => _CusBottomBarState();
}

class _CusBottomBarState extends State<CusBottomBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int selected = 0;

  List<Widget> _buildScreen() {
    return [
      const DashBoard(),
      const Center(
        child: Text("Second Page"),
      ),
      const MyMovie(),
      const Center(
        child: Text("four Page"),
      ),
      const Center(
        child: Text("five Page"),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      //Home
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/home.svg",
          height: 30,
          color:
              selected == 0 ? const Color(0xffE61E25) : const Color(0xff545454),
        ),
      ),

      //Calendário
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/calendar.svg",
          height: 30,
          color:
              selected == 1 ? const Color(0xffE61E25) : const Color(0xff545454),
        ),
      ),

      //movies
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(0, -8),
          child: CircleAvatar(
            backgroundColor: const Color(0xffE61E25),
            radius: 25,
            child: SvgPicture.asset(
              "assets/images/movie.svg",
              height: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),

      //Explorar
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/Discover.svg",
          height: 30,
          color:
              selected == 3 ? const Color(0xffE61E25) : const Color(0xff545454),
        ),
      ),

      //Perfil
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/profile-circle.svg",
          height: 30,
          color:
              selected == 4 ? const Color(0xffE61E25) : const Color(0xff545454),
        ),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PersistentTabView(
        context,
        onItemSelected: _onItemTapped,
        screens: _buildScreen(),
        items: _navBarItem(),
        backgroundColor: const Color.fromRGBO(17, 16, 16, 0.6),
        navBarStyle: NavBarStyle.simple,
      ),
    );
  }
}

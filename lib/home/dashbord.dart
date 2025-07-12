import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:todo/feature/auth/login/calender/celender_page.dart';
import 'package:todo/feature/focus/focus_page.dart';

import 'package:todo/home/home_page.dart';
import 'package:todo/home/widget/addtaskbottom.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Dashbord> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return const [
      HomePage(),
      CalederPage(),
      SizedBox(),
      FocusPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset("assets/nav/home.svg"),
        ),

        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        // icon: const Icon(Icons.search),
        icon: SvgPicture.asset("assets/nav/calender.svg"),
        title: ("Celender"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add, color: Colors.white, size: 32),
        title: "",
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),

        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,

        onPressed: (context) {
          showModalBottomSheet(
            context: context!,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const AddTaskBottomSheet(),
          );
        },
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_2),
        title: ("Focus"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Color(0xff363636),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style15,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Page", style: TextStyle(fontSize: 24)),
    );
  }
}

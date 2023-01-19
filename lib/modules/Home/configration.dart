import 'package:flutter/material.dart';

///Menu Colors

Color primaryGreen = Color(0xff7540fc);
List<BoxShadow> shadowList = [
  BoxShadow(
      color: Color(0x291466cc),
      offset: Offset(0, 15),
      blurRadius: 30,
      spreadRadius: 0)
];

///Menu  List

List<Map> drawerItems = [
  {'iconPath': 'assets/images/store.png', 'title': 'My Store'},
  {'iconPath': 'assets/images/profil.png', 'title': 'Profile'},
  {'iconPath': 'assets/images/setting.png', 'title': 'Settings'},
  {'iconPath': 'assets/images/help.png', 'title': 'Help'},
  {'iconPath': 'assets/images/sign-out.png', 'title': 'Sign Out'},
];

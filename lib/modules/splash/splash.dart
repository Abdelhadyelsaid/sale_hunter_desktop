import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/onboarding/onboarding.dart';

import '../settings/language.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState(){
    super.initState();
    _navigationtoOnBoared();
  }
  _navigationtoOnBoared()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding_Screen()));
  }

  @override
  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashpng'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/SaleHunterSemiHorizontal.png'),
              ) ,
            ),
          ],
        ),
      ),
      );
  }
}



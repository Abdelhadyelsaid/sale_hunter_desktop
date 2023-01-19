import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/components/MenuItems.dart';
import '../../shared/style/text.dart';
import '../settings/language.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({Key key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
        title: Text(
          _lang.tAboutUs(),
          style: MyTextStyle.header,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Container(
                          width: 700,
                          child: Text(
                            _lang.tWho(),
                            style: MyTextStyle.Who,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Container(
                          width: 700,
                          height: 400,
                          child: Text(
                            _lang.tWhoDes(),
                            style: MyTextStyle.WhoDes,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100 ,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 600,
                        height: 600,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/SaleHunterSemiHorizontal.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Center(
                          child: Text(
                            _lang.tServices(),
                            style: MyTextStyle.services ,
                          ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    height: 300,
                                    margin: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          color: Color.fromARGB(20, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                    child:
                                    Column(
                                      children: [
                                        ///icon
                                        Center(
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/recom.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///title
                                        Center(
                                          child:Text(
                                            _lang.trecom(),
                                            style: MyTextStyle.WhoDes,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ///des
                                        Center(
                                          child:Container(
                                            width: 300,
                                            child: Text(
                                              _lang.trecomdes(),
                                              style: MyTextStyle.style_get_the_code,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    width: 400,
                                    height: 300,
                                    margin: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          color: Color.fromARGB(20, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ///icon
                                        Center(
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/sto.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///title
                                        Center(
                                          child:Text(
                                            _lang.tCreateStore(),
                                            style: MyTextStyle.WhoDes,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ///des
                                        Center(
                                          child:Container(
                                            width: 300,
                                            child: Text(
                                              _lang.tCreateDes(),
                                              style: MyTextStyle.style_get_the_code,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    height: 300,
                                    margin: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          color: Color.fromARGB(20, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ///icon
                                        Center(
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/tracker.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///title
                                        Center(
                                          child:Text(
                                            _lang.tpricetracker(),
                                            style: MyTextStyle.WhoDes,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ///des
                                        Center(
                                          child:Container(
                                            width: 300,
                                            child: Text(
                                              _lang.tpricetrackerdes(),
                                              style: MyTextStyle.style_get_the_code,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50,),
                                  Container(
                                    width: 400,
                                    height: 300,
                                    margin: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          color: Color.fromARGB(20, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ///icon
                                        Center(
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/map.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///title
                                        Center(
                                          child:Text(
                                            _lang.tmap(),
                                            style: MyTextStyle.WhoDes,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ///des
                                        Center(
                                          child:Container(
                                            width: 300,
                                            child: Text(
                                              _lang.tmapdes(),
                                              style: MyTextStyle.style_get_the_code,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 50,),
                          Container(
                            width: 400,
                            height: 500,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),
                            child:Column(
                              children: [
                                ///icon
                                Center(
                                  child: Container(
                                    width: 350,
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/about.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                ///title
                                Center(
                                  child:Text(
                                    _lang.tQuick(),
                                    style: MyTextStyle.WhoDes,
                                  ),
                                ),
                                SizedBox(height: 20,),
                                ///des
                                Center(
                                  child:Container(
                                    width: 300,
                                    child: Text(
                                      _lang.tQuickdes(),
                                      style: MyTextStyle.style_get_the_code,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Stack(
                children: [
                  ///background
                  Container(
                    width: 1700,
                    height: 600,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/inst.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ///small image
                  Positioned(
                    right: 300,
                    bottom: 80,
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/des.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ) ,
                  ),
                  ///text to install
                  Positioned(
                    left:300,
                    bottom:300,
                    child: Container(
                      child: Text(
                        _lang.tinstall(),
                        style: MyTextStyle.Install,
                      ),
                    ),
                  ),
                  ///Buttom of Google play
                  Positioned(
                      left:300,
                      bottom:150,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Gp.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: TextButton(
                          onPressed: (){

                          },
                        ),
                      ),
                  ),
                  Positioned(
                    left:500,
                    bottom:150,
                    child: TextButton(
                      onPressed: (){

                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/SaleHunterSemiHorizontal.png'),
                            fit: BoxFit.contain,
                          ),
                        ),

                      ),
                    ),
                  ),
                ],

              ),
            ),
            ColoredBox(
              color: Color(0xff643df8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _lang.tOurTeam(),
                          style: MyTextStyle.ourteam,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/ahmed.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Ahmed Eldesoky',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'Frontend developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                          SizedBox(width: 100,),
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/hassan.jfif'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Hassan Elsayed',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'Frontend developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/samir.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Ahmed Samir',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'backend developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                          SizedBox(width: 100,),
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/yossef.jfif'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Ahmed Eldesoky',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'backend developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/amr.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Amr elkasaby',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'andriod developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                          SizedBox(width: 100,),
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/bibo.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Abdelhady Al Sayed',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'Flutter developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/nadeen.jfif'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Nadien Essam',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'UI / UX developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                          SizedBox(width: 100,),
                          Container(
                            width: 500,
                            height: 150,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                  color: Color.fromARGB(20, 0, 0, 0),
                                ),
                              ],
                            ),

                            child:Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/shaza.jfif'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                ///name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child:Text(
                                        'Shaza ehab',
                                        style: MyTextStyle.WhoDes,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child:Text(
                                        'Flutter developer',
                                        style: MyTextStyle.style_get_the_code,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
        ),
      )
    );
  }
}

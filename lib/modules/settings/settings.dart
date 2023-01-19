import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/settings/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/components/MenuItems.dart';
import '../../shared/style/text.dart';
import 'applocal.dart';

class Settings_Screen extends StatefulWidget {
  const Settings_Screen({Key key}) : super(key: key);

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  bool switchOn = false;
  String _selectedLanguage;
  bool _darkMode = false;
  bool _notifications = false;

  @override
  void initState() {
    super.initState();
    getSelectedPref();
  }

  @override
  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);
    Language _themechanger = Provider.of<Language>(context);


    return Scaffold(
      extendBody: true,
      ///AppBar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        ///Title of Home Screen
        title:  Text(
          _lang.tSettings(),
          style: MyTextStyle.header,
        ),

        ///SideMenu Icon
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
        ),
      ),
      body:SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 800,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/settings.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 150,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Appearance
                Center(
                  child: Container(
                    width:500.0,
                    height: 50.0,
                    child: Text(
                      _lang.tApper(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff707070),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                ///Light and Dark Buttoms
                Center(
                  child: Container(
                    width: 500.0,
                    height: 200,
                    child: Row(
                      children: [
                        ///light
                        Column(
                          children: [
                            TextButton(
                              onPressed: ()=> _themechanger.setTheme(
                                ThemeData.light().copyWith(
                                  primaryColor: Colors.white,
                                ),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/Light.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              _lang.tLightkMode(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xff707070),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                        ///Dark
                        Column(
                          children: [
                            TextButton(
                              onPressed: ()=> _themechanger.setTheme(
                                ThemeData.dark().copyWith(
                                  primaryColor: Colors.black,
                                ),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/Dark.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              _lang.tDarkMode(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xff707070),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                ///Language
                Center(
                  child: Container(
                    width:500.0,
                    height: 50.0,
                    child: Text(
                      _lang.tLanguage(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff707070),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                ///English Buttom
                Center(
                  child: Container(
                    width:500.0,
                    height: 50.0,
                    child: Row(
                      children: [
                        Radio(
                          value: 'en',
                          groupValue: _selectedLanguage,
                          onChanged: (value) async{
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString('language', value);
                            print(_selectedLanguage);
                            setState(() {
                              _selectedLanguage=value;
                              _lang.setLanguage(value);
                            });

                          },

                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          _lang.tEnglish(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xff707070),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ///Arabic Buttom
                Center(
                  child: Container(
                    width:500.0,
                    height: 50.0,
                    child: Row(
                      children: [
                        Radio(
                          value: 'ar',
                          groupValue: _selectedLanguage,
                          onChanged: (value)  async{
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString('language', value);
                            print(_selectedLanguage);
                            setState(() {
                              _selectedLanguage=value;
                              _lang.setLanguage(value);
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          _lang.tArabic(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xff707070),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
  getSelectedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = pref.getString('language');
    });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/change_Password/change_Paassword.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/components/Profile_Picture.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/components/MenuItems.dart';
import '../../shared/components/Rounded_bottom.dart';
import '../settings/language.dart';

import 'drawerScreen.dart';

class Profile extends DrawerContent {
  Profile({Key key, this.title});

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool visible = true;
  FToast fToast;
  String initialValue = 'Country';
  String email = '', profileImage = '', last_seen = '';

  // final List<String> country = [
  //   'Country',
  //   'Egypt',
  //   'USA',
  //   'Italy',
  //   'Spain',
  //   'German',
  //   'lebanon',
  //   'Emirates',
  //   'China',
  //   'Japan',
  //   'Turkey',
  // ];
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    getCred();
  }

  void getCred() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      // name=preferences.getString('fullname');
      email = preferences.getString('email');
      // profileImage=preferences.getString('ProfileImage');
      last_seen = preferences.getString('last_seen');
    });
  }

  _showToast(String Message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("$Message"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  _showErrorToast(String Message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning),
          SizedBox(
            width: 12.0,
          ),
          Text("$Message"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  Widget build(BuildContext context) {
    Language _lang = Provider.of<Language>(context);
    final userdata = Provider.of<ProfileData>(context, listen: false);
    _userNameController.text = userdata.profileData.nameedit;
    // userdata.profileData.nameedit;
    return Scaffold(
      extendBody: true,

      ///AppBar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        ///Title of Home Screen
        title: Text(
          _lang.tProfile(),
          style: MyTextStyle.header,
        ),

        ///SideMenu Icon
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Image.asset('assets/images/back.png'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MenuItems()));
                getuserData();
              },
            ),
          ),
        ),

      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 800,
                        height: 500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 150,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///Avatar
                      Center(
                        child: Profile_Picture(),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),

                      ///form
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///user name
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _lang.tUserName(),
                                  style: MyTextStyle.textform,
                                ),
                              ),
                              Container(
                                width: 400,
                                child: TextFormField(
                                  controller: _userNameController,
                                  validator: (value) {
                                    String pattern = r'(^[a-zA-Z ]*$)';
                                    RegExp regExp = new RegExp(pattern);
                                    if (value.isEmpty) {
                                      return 'Username is required';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Username must be a-z and A-Z';
                                    }
                                    return null;
                                  },
                                  style: MyTextStyle.textform,
                                  decoration: InputDecoration(
                                    //hintText: '$name',
                                    //  border: InputBorder.none,
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: Color(0x07000000),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xff8743ff)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white, width: 0.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              SizedBox(height: 10),

                              ///Email
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _lang.tEmail(),
                                  style: MyTextStyle.textform,
                                ),
                              ),
                              Container(
                                width: 400,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: _emailController,
                                  style: MyTextStyle.textform,
                                  decoration: InputDecoration(
                                    hintText: '$email',
                                    border: InputBorder.none,
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: Color(0x07000000),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xff8743ff)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white, width: 0.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  // validator: (value) {
                                  //   String pattern =
                                  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  //   RegExp regExp = new RegExp(pattern);
                                  //   if (value.isEmpty) {
                                  //     return 'Email is required';
                                  //   } else if (!regExp.hasMatch(value)) {
                                  //     return 'Invalid email';
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                ),
                              ),
                              SizedBox(height: 10),

                              ///Password
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _lang.tPass(),
                                  style: MyTextStyle.textform,
                                ),
                              ),
                              Container(
                                width: 400,
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: visible,
                                  readOnly: true,
                                  style: MyTextStyle.textform,
                                  decoration: InputDecoration(
                                    hintText: '• • • • • • • • • • •',
                                    border: InputBorder.none,
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: Color(0x07000000),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xff8743ff)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white, width: 0.0),
                                    ),
                                    suffixIcon: InkWell(
                                      child: visible
                                          ? Icon(
                                              Icons.visibility_off,
                                              size: 18,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              size: 18,
                                            ),
                                      onTap: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  // validator: (value) {
                                  //   String pattern =
                                  //       r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                  //   RegExp regExp = new RegExp(pattern);
                                  //   if (value.isEmpty) {
                                  //     return 'Password is required';
                                  //   } else if (!regExp.hasMatch(value)) {
                                  //     return 'Password must Contain Characters,numbers and Special Characters';
                                  //   } else if (value.length < 8) {
                                  //     return 'Password must be at least 8 characters';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Buttom of change password
                      Center(
                        child: Container(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Change_Password()),
                                  );
                                },
                                child: Text(
                                  _lang.tChangePass(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Rounded_Bottom(
                        hintText: 'Save',
                        func: () {
                          if (_formKey.currentState.validate()) {
                            UpdateUser(_userNameController.text);
                          }
                        },
                      ),
                      SizedBox(height: 15.0),

                      ///have a store?
                      Center(
                        child: Container(
                          width: 400.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/haveastore.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> getuserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String Token = preferences.getString("Authorize");
    Response response = await http.get(
      Uri.parse(AppUrl.getuser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'client': 'mobile',
        'Authorization': 'Bearer $Token',
      },
    );
    var _data = jsonDecode(response.body);
    String message = _data['message'];

    if (response.statusCode == 200) {

      print('Data get sucess!');

      var user =_data['user'];
      String emailSave = user['email'];
      String nameSave = user['fullname'];
      String profileSave = user['profile_img'];


      final editprofiledata = Provider.of<ProfileData>(context, listen: false);
      editprofiledata.profileData.nameedit =nameSave;
      editprofiledata.profileData.imageUrl =profileSave;

      // savedata(emailSave,nameSave,profileSave,seenSave);
    } else {
      print('Error Get Data');
      print(message);
    }
  }
  Future<void> UpdateUser(String Name) async {
    final userdata = Provider.of<ProfileData>(context, listen: false);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String BaseImage = preferences.getString("Base64_image");
    String Token = preferences.getString("Authorize");
    Map data = {
      'fullname': '$Name',
      'profile_img': 'data:image/png;base64,$BaseImage',
    };
    // print(data.toString());

    if (_formKey.currentState.validate()) {
      Response response = await http.patch(
        Uri.parse(AppUrl.updateUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
          'Authorization': 'Bearer $Token',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body)['user'];
      print('This is Token: $Token');
     //String message = _data['message'];
      if (response.statusCode == 200) {
        preferences.setString("ProfileImage", _data['profile_img']);
        preferences.setString("fullname", Name);

        userdata.profileData.nameedit = Name;
        userdata.profileData.imageUrl = _data['profile_img'];

        print('This is image: $profileImage');
        print('User Updated Successfully');

        _showToast("Profile Updated Successfully!");
      } else {
        _showErrorToast("Please try again !");
        print(_data);
      }
      print(_data);
    }
  }
}

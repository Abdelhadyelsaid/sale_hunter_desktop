import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/Home/myStore.dart';
import 'package:sale_hunter/modules/create_Store/Create_Store.dart';
import 'package:sale_hunter/modules/forget_password/forget_password.dart';
import 'package:sale_hunter/modules/sign_up/sign_up.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../shared/components/MenuItems.dart';
import '../settings/language.dart';

class Sign_In_Screen extends StatefulWidget {
  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isHidden = true;
  bool visible = true;
  bool cvisible = true;
  bool value = false;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
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

  @override
  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,

      ///AppBar

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          _lang.tSignIn(),
          style: MyTextStyle.header,
        ),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 800,
                    height: 700,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _lang.twelSign(),
                        style: TextStyle(
                          color: Color(0xff8743ff),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                        ),

                      ),
                      SizedBox(height: 20),
                      Text(
                        _lang.tdesSignin(),
                        style: TextStyle(
                          color: Color.fromRGBO(159,159, 159, 100),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    child: TextFormField(
                      controller: _emailController,
                      style: MyTextStyle.textform,
                      decoration: InputDecoration(
                        hintText: _lang.tEmail(),
                        border: InputBorder.none,
                        counter: Offstage(),
                        filled: true,
                        fillColor: Color(0x07000000),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff8743ff)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if (value.isEmpty) {
                          return 'Email is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Password
                  Container(
                    width: 400,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: visible,
                      style: MyTextStyle.textform,
                      decoration: InputDecoration(
                        hintText: _lang.tPass(),
                        border: InputBorder.none,
                        counter: Offstage(),
                        filled: true,
                        fillColor: Color(0x07000000),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff8743ff)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0.0),
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ///Forget Password
                  Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgetPassword()),
                            );
                          },
                          child: Text(
                            _lang.tForgetPass(),
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
                  SizedBox(height: 20),

                  ///Sign In Buttom
                  Rounded_Bottom(
                    hintText: _lang.tSignIn(),
                    func: () async{
                      if(formKey.currentState.validate()) {
                        login(_emailController.text, _passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///Sign In Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _lang.tSignInText(),
                        style: MyTextStyle.description,
                      ),
                      SizedBox(width: 5.0,),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sign_Up_Screen()),
                          );
                        },
                        child: Text(
                          _lang.tSignUp(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xff643df8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(email, password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    print(data.toString());

    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Response response = await http.post(
        Uri.parse(AppUrl.signin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      String _headers =response.headers['authorization'];
      print('This is myToken: $_headers');
      String message = _data['message'];

      if (response.statusCode == 200) {
        print('Sign in success');
     //   _showToast(message);
        var user =_data['user'];
        int storeId =user['store_id'];
        if(storeId==null){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Create_Store()),
          );
        }
        else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuItems()),
          );
        }
        SaveToken(_headers);
        String emailSave = user['email'];
        String nameSave = user['fullname'];
        String profileSave = user['profile_img'];
        String seenSave = user['last_seen'];
        ///Pass to provider
        final editprofiledata = Provider.of<ProfileData>(context, listen: false);
        editprofiledata.profileData.nameedit =nameSave;
        editprofiledata.profileData.imageUrl =profileSave;
        if(storeId!=null){
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setInt('store_id', storeId);
          editprofiledata.profileData.sroreID=storeId;
        }
        savedata(emailSave,nameSave,profileSave,seenSave);
        print(_data);
      } else {
        print('Wrong email or password');
        _showErrorToast('Wrong email or password');
        print(_data);
      }
    }
  }


  void savedata(String email,String fullname,String profile_img,String last_seen) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", email);
    preferences.setString("fullname", fullname);
    preferences.setString("ProfileImage", profile_img);
    preferences.setString("last_seen", last_seen);

  }

  void SaveToken(String authorize)async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString('Authorize', authorize);
  }
}
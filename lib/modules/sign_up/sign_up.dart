import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../settings/language.dart';

class Sign_Up_Screen extends StatefulWidget {
  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  bool visible = true;
  bool cvisible = true;
  bool isLoading = false;
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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sign_In_Screen()),
            );
          },
          icon: Image.asset('assets/images/back.png'),
        ),
        title: Text(
          _lang.tSignUp(),
          style: MyTextStyle.header,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 700,
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/signup.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 250,
              ),
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
                        _lang.tdesSignUp(),
                        style: TextStyle(
                          color: Color.fromRGBO(159, 159, 159, 100),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),

                  ///user name
                  Container(
                    width: 400,
                    child: Center(
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
                          hintText: _lang.tUserName(),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Email
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
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
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
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        String pattern =
                            r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = new RegExp(pattern);
                        if (value.isEmpty) {
                          return 'Password is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Password must Contain Characters,numbers and Special Characters';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  ///confirm password
                  Container(
                    width: 400,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: cvisible,
                      style: MyTextStyle.textform,
                      decoration: InputDecoration(
                          hintText: _lang.tConfPass(),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          suffixIcon: InkWell(
                            child: cvisible
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
                                cvisible = !cvisible;
                              });
                            },
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return value.isEmpty
                            ? 'Confirm password is required'
                            : validationEqual(value, _passwordController.text)
                                ? null
                                : 'Password not match';
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  ///SignUp buttom
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Rounded_Bottom(
                      hintText: _lang.tSignUp(),
                      func: () {
                        // if(isLoading)
                        // {
                        //   return;
                        // }
                        if (_formKey.currentState.validate()) {
                          signup(
                              _userNameController.text,
                              _emailController.text,
                              _passwordController.text,
                              _confirmPasswordController.text);
                        }
                      },
                    ),
                  ),

                  ///Sing in Back to

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _lang.tHaveAcc(),
                        style: MyTextStyle.description,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sign_In_Screen()),
                          );
                        },
                        child: Text(
                          _lang.tSignIn(),
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

  validationEqual(String currentValue, String checkValue) {
    return currentValue == checkValue ? true : false;
  }

  Future<void> signup(String name, String email, String password,
      String confirmpassword) async {
    Map data = {
      'fullname': name,
      'email': email,
      'password': password,
      'passwordConfirm': confirmpassword,
    };
    print(data.toString());

    if (_userNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      Response response = await http.post(
        Uri.parse(AppUrl.signup),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      String message = _data['message'];
      if (_formKey.currentState.validate() && response.statusCode == 201) {
        var user = _data['user'];
        print(user['email']);
        print('Sign UP success');
        print(_data);
        _showToast(message);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sign_In_Screen()),
        );
      } else {
        _showErrorToast(message);
        print(_data);
      }
    }
  }
}

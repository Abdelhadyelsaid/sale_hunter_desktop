import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/modules/verification_code/verification_code.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings/language.dart';


class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visible = true;
  bool cvisible = true;
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

      ///AppBar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context
            );
          },
          icon: Image.asset('assets/images/back.png'),

        ),
        title:  Text(
          _lang.tResetPass(),
          style: MyTextStyle.header,
        ),
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
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
                        image: AssetImage('assets/images/resetpass.PNG'),
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
                  ///Description
                  Container(
                    width: 400,
                    child: Text(
                      _lang.tResetPassDesc(),
                        style: MyTextStyle.description,
                    ),
                  ),
                  SizedBox(height: 30,),
                  ///set new Password
                  Container(
                    width: 400,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: visible,
                      style: MyTextStyle.textform,
                      decoration: InputDecoration(
                        hintText: _lang.tNewPass(),
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
                        String pattern =
                            r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = new RegExp(pattern);
                        if (value.isEmpty) {
                          return 'Password is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Password must have chars,numbers and Special Chars';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

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
                        ),
                      ),
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

                  ///Reset Password Button
                  Rounded_Bottom(
                    hintText: _lang.tResetPass(),
                    func: () {
                      if (_formKey.currentState.validate()) {
                        ResetPassword(_passwordController.text, _confirmPasswordController.text);
                      }

                    },
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

  Future<void> ResetPassword(password, confirmPassword) async {
    Map data = {
      'password': password,
      'passwordConfirm': confirmPassword,
    };
    print(data.toString());

    if (_confirmPasswordController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String ResetToken =preferences.getString("Token");
      Response response = await http.patch(
        Uri.parse("https://sale-hunter.herokuapp.com/api/v1/users/auth/resetPassword/$ResetToken"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client':'mobile',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      String message = _data['message'];
      if (response.statusCode == 200 ) {
        print('Password Reset Successfully');
        _showToast("Password Reseted Successfully");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Sign_In_Screen()),(route)=>false);
      } else {
      _showErrorToast("Please try again !");
        print(_data);
      }
      print(_data);
    }
  }
}

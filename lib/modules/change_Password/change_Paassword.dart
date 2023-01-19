import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/Home/profile.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';

import '../settings/language.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  final formKey = GlobalKey<FormState>();
  bool oldvisible = true;
  bool newvisible=true;
  bool value = false;
  bool confirmvisible = true;
  FToast fToast;
  final TextEditingController _oldpasswordController = new TextEditingController();
  final TextEditingController _newpasswordController = new TextEditingController();
  final TextEditingController _confirmpasswordController = new TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/images/back.png'),
        ),
        title: Text(
          _lang.tChangePass(),
          style: MyTextStyle.header,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ///Old Password
              Center(
                child: Container(
                  width: 500,
                  child: TextFormField(
                    controller: _oldpasswordController,
                    obscureText: oldvisible,
                    style: MyTextStyle.textform,
                    decoration: InputDecoration(
                      hintText: _lang.tOldPass(),
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
                        child: oldvisible
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
                            oldvisible = !oldvisible;
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
              ),
              SizedBox(height: 20.0,),
              ///New Password
              Center(
                child: Container(
                  width: 500,
                  child: TextFormField(
                    controller: _newpasswordController,
                    obscureText: newvisible,
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
                          child: newvisible
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
                              newvisible = !newvisible;
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
              ),
              SizedBox(height: 20.0,),
              ///confirm Password
              Center(
                child: Container(
                  width: 500,
                  child: TextFormField(
                    controller: _confirmpasswordController,
                    obscureText: confirmvisible,
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
                          borderSide: BorderSide(color: Colors.white, width: 0.0),
                        ),
                        suffixIcon: InkWell(
                          child: confirmvisible
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
                              confirmvisible = !confirmvisible;
                            });
                          },
                        )),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      return value.isEmpty
                          ? 'Confirm password is required'
                          : validationEqual(value, _newpasswordController.text)
                          ? null
                          : 'Password not match';
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0,),

              ///Change Password Buttom
              Center(
                child: Container(
                  width: 500,
                  height: 56,
                  child: Rounded_Bottom(
                    hintText: _lang.tChangePass(),
                    func: () {
                      if(formKey.currentState.validate()) {
    ChangePassword(_oldpasswordController.text, _newpasswordController.text, _confirmpasswordController.text);
    }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> ChangePassword(oldPassword,password, confirmPassword) async {
    Map data = {
      'oldPassword':oldPassword,
      'newPassword': password,
      'newPasswordConfirm': confirmPassword,
    };
    print(data.toString());

    if (_oldpasswordController.text.isNotEmpty &&_newpasswordController.text.isNotEmpty && _confirmpasswordController.text.isNotEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String Token =preferences.getString("Authorize");
      Response response = await http.patch(
        Uri.parse(AppUrl.updatePassword),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client':'mobile',
          'Authorization': 'Bearer $Token',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      print(Token);
      String message = _data['message'];
      if (response.statusCode == 200 ) {
        print('Password Updated Successfully');
        _showToast("Password Updated Successfully");
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
validationEqual(String currentValue, String checkValue) {
  return currentValue == checkValue ? true : false;
}

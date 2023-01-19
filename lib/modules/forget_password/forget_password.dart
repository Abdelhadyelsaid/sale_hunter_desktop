import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/modules/verification_code/verification_code.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings/language.dart';
class forgetPassword extends StatefulWidget {
  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final TextEditingController _emailController = new TextEditingController();
  ScaffoldMessengerState scaffoldMessenger;
  final formKey = GlobalKey<FormState>();
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
      toastDuration: Duration(seconds: 5),
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
      toastDuration: Duration(seconds: 3),
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
          _lang.tForget(),
          style: MyTextStyle.header,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
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
                        image: AssetImage('assets/images/forgetpass.png'),
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
                      _lang.tForgetDesc(),
                      style: MyTextStyle.description,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 400,
                    child: Form(
                      key: formKey,
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
                  ),
                  SizedBox(height: 30),
                  ///Button
                  Rounded_Bottom(
                    hintText: _lang.tSendCode(),
                    func: () {
     if (formKey.currentState.validate()) {
       forget_password(_emailController.text);
     }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> forget_password(email) async {
    Map data = {
      'email': email,
    };
    print(data.toString());
    if (_emailController.text.isNotEmpty) {
      Response response = await http.post(
        Uri.parse(AppUrl.forgotPassword),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client':'mobile',
        },
        body: jsonEncode(data),
      );

      var _data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        print('A valid Mail');
        print(_data);
       _showToast(" Verification code Successfully sent to your Mail ! ");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerficationCode()),
        );
      } else {
        _showErrorToast(" Please Enter a Valid Mail ! ");
      }
      print(_data);
    }
  }
  void saveResetpin(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", email);
  }
}

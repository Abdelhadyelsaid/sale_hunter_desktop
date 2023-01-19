import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/reset_password/reset_password.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/modules/forget_password/forget_password.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../settings/language.dart';

class VerficationCode extends StatefulWidget {
  @override
  State<VerficationCode> createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode> {
  int start = 30;
  bool wait = false;
  String code = "";
  final TextEditingController _verifycontroller = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  FToast fToast;
  Timer _timer;


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    startTimer();
    setState(() {
     start =30;
      wait =true;
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            wait=false;
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
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

      ///Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context
            );
          },
          icon: Image.asset('assets/images/back.png'),

        ),
        title: Text(
          _lang.tVerCode(),
          style: MyTextStyle.header,
        ),
      ),

      body: SafeArea(
        child: Center(
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
                        image: AssetImage('assets/images/ver.png'),
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
                      _lang.tVerDesc(),
                      style: MyTextStyle.description,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 400,
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.,]+')),
                          ],
                          controller: _verifycontroller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the sent code !';
                            }
                            return null;
                          },
                          style: MyTextStyle.textform,
                          decoration: InputDecoration(
                            hintText:_lang.tVerCode(),
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: _lang.tSendCodeAgain(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' $start ',
                        style: TextStyle(fontSize: 16, color: Colors.redAccent),
                      ),
                      TextSpan(
                        text: 'sec',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ]),
                  ),

                  SizedBox(height: 30),
                  ///Verify Button
                  Rounded_Bottom(
                    hintText: _lang.tVerify(),
                    func: () {
                      if (formKey.currentState.validate()) {
                        verifyToken(_verifycontroller.text);
                      }
                      print(_verifycontroller);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///ResendCode
                   //ResendCode(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_lang.tSendCodeDesc(), style: MyTextStyle.style_get_the_code),
                  TextButton(
                    onPressed:wait? null
                        : (){
                      startTimer();
                      setState(() {
                        start = 30;
                        wait = true;
                      });
                      },

                    child: Text(
                      _lang.tReSendCode(),
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: wait ? Colors.grey :Color(0xff643df8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

  Future<void> verifyToken(String ResetToken) async {
    Map data = {
      'resetToken': ResetToken,
    };

    print(data.toString());
    if (_verifycontroller.text.isNotEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String EmailToken =preferences.getString("email");
      Response response = await http.get(
        Uri.parse(
            "https://sale-hunter.herokuapp.com/api/v1/users/verifyEmailToken/$ResetToken"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
        },
      );
      print(_verifycontroller);
      var _data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(_data);
        _showToast("Success !");
        saveResetpin(ResetToken);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetPassword()),
        );
      } else {
        _showErrorToast("Not Valid Code !");
        print(_data);
      }
    }
  }
  void saveResetpin(String Reset_Token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Token", Reset_Token);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/create_Store/Create_Store.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/userData.dart';
import '../../shared/components/MenuItems.dart';
import '../../shared/components/store_Picture.dart';
import '../../shared/style/text.dart';
import '../map/map.dart';
import '../settings/language.dart';

class Seller_Settings extends StatefulWidget {
  const Seller_Settings({Key key}) : super(key: key);

  @override
  State<Seller_Settings> createState() => _Seller_SettingsState();
}

class _Seller_SettingsState extends State<Seller_Settings> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _storeNameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _whatsappController = new TextEditingController();
  final TextEditingController _facebookController = new TextEditingController();
  final TextEditingController _instagarmController = new TextEditingController();
  final TextEditingController _websiteController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _typeController = new TextEditingController();
  final TextEditingController _locationController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();
  FToast fToast;
bool visible= true;
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

    final editstore =Provider.of<Storedatato>(context, listen: false);
    _storeNameController.text=editstore.storedatato.storeName;
    _mobileController.text= editstore.storedatato.phone;
    _whatsappController.text=editstore.storedatato.whatsapp;
    _locationController.text=editstore.storedatato.address;
    _websiteController.text= editstore.storedatato.website;
    _facebookController.text= editstore.storedatato.facebook;
    _instagarmController.text= editstore.storedatato.instagram;
    _typeController.text= editstore.storedatato.type;
    _descriptionController.text= editstore.storedatato.description;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuItems()),
            );
          },
          icon: Image.asset('assets/images/back.png'),

        ),
        title: Text(
          _lang.tSettings(),
          style: MyTextStyle.header,
        ),

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                ///Avatar
                Center(
                  child: Store_Picture(),

                ),
                SizedBox(height: 30.0,),
                ///form
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ///Store name and Phone
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///Store name
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _storeNameController,
                                validator: (value) {
                                  String pattern = r'(^[ _a-zA-Z ]*$)';
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
                                  hintText: _lang.tStoreName(),
                                  border: InputBorder.none,
                                  counter: Offstage(),
                                  filled: true,
                                  fillColor: Color(0x07000000),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide:
                                    BorderSide(width: 1, color: Color(0xff8743ff)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            SizedBox(width: 20),
                            ///Phone
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _mobileController,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff9b9ca8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                decoration: InputDecoration(
                                  hintText: _lang.tPhone(),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]+')),
                                ],
                                validator: (value) {
                                  String pattern = r'([0-9.,]+)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.replaceAll(" ", "").isEmpty) {
                                    if (value.replaceAll(" ", "").isEmpty) {
                                      return 'Mobile is required';
                                    }
                                    else if (value.replaceAll(" ", "").length != 10) {
                                      return 'Mobile number must 10 digits';
                                    }
                                    else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
                                      return 'Mobile number must be digits';
                                    }
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ///Whatsapp and location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///Whatsapp
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _whatsappController,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff9b9ca8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                decoration: InputDecoration(
                                  hintText: _lang.tWhatsapp(),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]+')),
                                ],
                                validator: (value) {
                                  String pattern = r'([0-9.,]+)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.replaceAll(" ", "").isEmpty) {
                                    if (value.replaceAll(" ", "").isEmpty) {
                                      return 'Mobile is required';
                                    }
                                    else if (value.replaceAll(" ", "").length != 10) {
                                      return 'Mobile number must 10 digits';
                                    }
                                    else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
                                      return 'Mobile number must be digits';
                                    }
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            ///Type
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _typeController,
                                validator: (value) {
                                  String pattern = r'(^[a-zA-Z ]*$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    return 'Type is required';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Type must be a-z and A-Z';
                                  }
                                  return null;
                                },
                                style: MyTextStyle.textform,

                                decoration: InputDecoration(
                                  hintText: _lang.tStoreType(),
                                  border: InputBorder.none,
                                  counter: Offstage(),
                                  filled: true,
                                  fillColor: Color(0x07000000),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide:
                                    BorderSide(width: 1, color: Color(0xff8743ff)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 10),
                        ///address and Store type
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 1020,
                              child: TextFormField(

                                controller: _locationController,
                                validator: (value) {
                                  String pattern = r'(^[a-zA-Z ]*$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    return 'Location is required';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Enter A valid location!';
                                  }
                                  return null;
                                },
                                style: MyTextStyle.textform,

                                decoration: InputDecoration(
                                  hintText: _lang.tLocation(),
                                  border: InputBorder.none,
                                  counter: Offstage(),
                                  filled: true,
                                  fillColor: Color(0x07000000),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide:
                                    BorderSide(width: 1, color: Color(0xff8743ff)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.location_searching),
                                    onPressed:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InteractiveMapPage()),
                                      );
                                    },
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 10),
                        ///Facebook Link and  instagram link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///Facebook Link
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _facebookController,
                                validator: (value) {
                                  String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.length == 0) {
                                    return 'Please enter url';
                                  }
                                  else if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid url';
                                  }
                                  return null;
                                },
                                style: MyTextStyle.textform,

                                decoration: InputDecoration(
                                  hintText: _lang.tFacebookLink(),
                                  border: InputBorder.none,
                                  counter: Offstage(),
                                  filled: true,
                                  fillColor: Color(0x07000000),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide:
                                    BorderSide(width: 1, color: Color(0xff8743ff)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            ///Instagram Link
                            SizedBox(width: 20.0,),
                            Container(
                              width: 500,
                              child: TextFormField(
                                controller: _instagarmController,
                                validator: (value) {
                                  String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.length == 0) {
                                    return 'Please enter url';
                                  }
                                  else if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid url';
                                  }
                                  return null;
                                },
                                style: MyTextStyle.textform,

                                decoration: InputDecoration(
                                  hintText: _lang.tInstagarmLink(),
                                  border: InputBorder.none,
                                  counter: Offstage(),
                                  filled: true,
                                  fillColor: Color(0x07000000),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide:
                                    BorderSide(width: 1, color: Color(0xff8743ff)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ///Website Link
                        Center(
                          child: Container(
                            width: 1000,
                            child: TextFormField(
                              controller: _websiteController,
                              validator: (value) {
                                String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                                RegExp regExp = new RegExp(pattern);
                                if (value.length == 0) {
                                  return 'Please enter url';
                                }
                                else if (!regExp.hasMatch(value)) {
                                  return 'Please enter valid url';
                                }
                                return null;
                              },
                              style: MyTextStyle.textform,

                              decoration: InputDecoration(
                                hintText: _lang.tWebsiteLink(),
                                border: InputBorder.none,
                                counter: Offstage(),
                                filled: true,
                                fillColor: Color(0x07000000),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  borderSide:
                                  BorderSide(width: 1, color: Color(0xff8743ff)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ///Description
                        Center(
                          child: Container(
                            width: 1000,
                            height: 128,
                            child: TextFormField(
                              maxLines: 10,
                              minLines: 3,
                              controller: _descriptionController,
                              validator: (value) {
                                String pattern = r'(^[ _a-zA-Z0-9., ]*$)';
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

                                hintText: _lang.tDesc(),
                                border: InputBorder.none,
                                counter: Offstage(),
                                filled: true,
                                fillColor: Color(0x07000000),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  borderSide:
                                  BorderSide(width: 1, color: Color(0xff8743ff)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ///save Buttom and delete Buttom
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///Save Buttom
                            Container(
                              width: 500,
                              height: 56,
                              child: Rounded_Bottom(
                                hintText: _lang.tUpdateStore(),
                                func: (){
                                  if(_formKey.currentState.validate()) {
                                  //   final Store update = new Store();
                                  //   update.UpdateStore( _storeNameController.text,
                                  // _mobileController.text,
                                  // _whatsappController.text,
                                  // _addressController.text,
                                  // _typeController.text,
                                  // _facebookController.text,
                                  // _instagarmController.text,
                                  // _websiteController.text,
                                  // _descriptionController.text);
                                    UpdateStore(
                                        _storeNameController.text,
                                        _mobileController.text,
                                        _whatsappController.text,
                                        _locationController.text,
                                        _typeController.text,
                                        _facebookController.text,
                                        _instagarmController.text,
                                        _websiteController.text,
                                        _descriptionController.text);
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            ///Delete Buttom
                            Container(
                              width: 500,
                              height: 56,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color:Color.fromRGBO(255, 79, 4, 10),
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                               // color:Color.fromRGBO(255, 79, 4, 30),
                              ),

                              child: TextButton(
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupDialog(context),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    _lang.tDelete(),
                                    style: MyTextStyle.deletefont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPopupDialog(BuildContext context) {
    var _lang = Provider.of<Language>(context);
    return AlertDialog(
      title: const Text('Enter Your Password'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 368,
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
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
               verifyDeleteStore(_passwordController.text);
              },
              child: const Text('OK'),
            ),
          ],
        ),

      ],
    );
  }

  Future<void> DeleteStoreAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String Token = preferences.getString("Authorize");
    int Store_id = preferences.getInt("store_id");
    print('This is ID: $Store_id');
    String deletestore = AppUrl.createStore + '/$Store_id';
    Response response = await http.delete(
      Uri.parse(deletestore),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'client': 'mobile',
        'Authorization': 'Bearer $Token',
      },
    );
    if (response.statusCode == 204) {

      _showToast("Store deleted successfully !");
      print('Store Deleted');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Create_Store()),
      );
    } else {
      _showErrorToast('Something went Wrong');
      print('Something went Wrong');
    }
  }

  ///Verify Delete Store

  Future<void> verifyDeleteStore(String Password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email");
    Map data = {
      'email': email,
      'password':Password ,
    };
    Response response = await http.post(
      Uri.parse(AppUrl.signin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if(response.statusCode ==200){
      //_showToast("Correct Password");
      DeleteStoreAPI();
      print('Correct Password');
    }
    else{
      _showErrorToast("InCorrect Password");
      print('Password incorrect');
    }
  }
  Future<void> UpdateStore(String name, String phone,String whatsapp, String address,
      String type, String facebook,String instagram ,String website,String description) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String BaseStoreImage = preferences.getString("Base_StoreImage");
      String Token = preferences.getString("Authorize");
     // final userData =Provider.of<ProfileData>(context,listen: false);
      double latitude =preferences.getDouble("latitude");
      double longitude =preferences.getDouble("longitude");
     int Store_id = preferences.getInt("store_id");
    // userData.profileData.sroreID=Store_id;
    Map data = {
      'logo':'data:image/png;base64,$BaseStoreImage',
      'name': name,
      'phone': phone,
      'whatsapp':whatsapp,
      'address': address,
      'niche_market': type,
      'facebook': facebook,
      'instagram': instagram,
      'website': website,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
    };
    print(data.toString());
    print('This is store $Store_id');
    String updatestore= AppUrl.createStore+'/$Store_id';
      Response response = await http.patch(
        Uri.parse(updatestore),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
          'Authorization': 'Bearer $Token',
        },
        body: jsonEncode(data),
      );
     var _data = jsonDecode(response.body);
      String message = jsonDecode(response.body)['message'];


      // saveStoredata(store['id'],store['name'],store['phone'],store['whatsapp'],store['address'],store['facebook'],store['instagram'],store['website'],store['description'],store['niche_market']);
      if ( response.statusCode == 200) {
        print('Store updated');
       print(_data);
        _showToast(message);
        // userdata.profileData.storeID =store['id'] ;
      } else {
        _showErrorToast(message);
        print(_data);
        print('Error');
      }

  }
}

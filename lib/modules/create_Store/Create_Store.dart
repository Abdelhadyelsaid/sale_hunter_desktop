import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/components/Rounded_bottom.dart';
import 'package:sale_hunter/shared/components/store_Picture.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/components/MenuItems.dart';
import '../../shared/style/text.dart';
import '../Home/drawerScreen.dart';
import '../Home/myStore.dart';
import '../map/map.dart';
import '../settings/language.dart';

class Create_Store extends DrawerContent {
   Create_Store({Key key,this.title}) ;

   final String title;
  @override
  State<Create_Store> createState() => _Create_StoreState();
}

class _Create_StoreState extends State<Create_Store> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _storeNameController = new TextEditingController();
  final TextEditingController _whatsappController = new TextEditingController();
  final TextEditingController _facebookController = new TextEditingController();
  final TextEditingController _instagarmController = new TextEditingController();
  final TextEditingController _websiteController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _typeController = new TextEditingController();
  final TextEditingController _locationController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();
  String initialValue = 'type';

  FToast fToast;
  // ToastMessage toastmessage;
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuItems()),
            );
          },
          icon: Image.asset('assets/images/back.png'),

        ),
        title: Text(
          _lang.tCreateStore(),
          style: MyTextStyle.header,
        ),
      ),
      body: ListView(
          children:[
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
                              SizedBox(width: 20.0,),
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
                                  maxLength: 11,
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
                                  maxLength: 11,
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
                          ///address
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
                          ///Facebook Link and Instagram link
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
                              width: 1020,
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
                              width: 1020,
                             // height: 300,
                              child: TextFormField(
                                maxLines: 5,
                                controller: _descriptionController,
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

                          ///creation Buttom
                          Center(
                            child: Container(
                              width: 500,
                              height: 56,
                              child: Rounded_Bottom(
                                hintText: _lang.tCreateStore(),
                                func: (){
                                  if(_formKey.currentState.validate()) {
                                    CreateStore(
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
  Future<void> CreateStore(String name, String phone,String whatsapp, String location,
      String type, String facebook,String instagram ,String website,String description) async {
    final userdata = Provider.of<ProfileData>(context, listen: false);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String BaseStoreImage = preferences.getString("Base_StoreImage");
    double longitude =preferences.getDouble("longitude");
    double latitude =preferences.getDouble("latitude");
    String Token = preferences.getString("Authorize");
    print("This is Token: $Token");
    Map data = {
      'logo':'data:image/jpeg;base64,$BaseStoreImage',
      'name': name,
      'phone': phone,
      'whatsapp':whatsapp,
      'address': location,
      'niche_market': type,
      'facebook': facebook,
      'instagram': instagram,
      'website': website,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
    };
    print(data.toString());
      Response response = await http.post(
        Uri.parse(AppUrl.createStore),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
          'Authorization': 'Bearer $Token',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      String message = _data['message'];
      var store =_data['store'];

      if (  response.statusCode == 201) {
        print('Store Created');
        print(_data);
        var store =_data['store'];
        print(store['id']);
        _showToast(message);
        userdata.profileData.sroreID =store['id'] ;
        preferences.setInt("store_id", store['id']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyStore()),
        );
        saveStoredata(store['id'],store['logo'],store['name'],store['phone'],store['whatsapp'],store['address'],store['facebook'],store['instagram'],store['website'],store['description'],store['niche_market']);
      } else {
        _showErrorToast(message);
        print(_data);
        print('Error ');
      }

  }
  void saveStoredata(int storeID,String StoreImage,String storeName,String phone,String whatsapp,String address,String facebook,String instagram,String website,String description,String type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final editstore =Provider.of<Storedatato>(context, listen: false);
    final userData =Provider.of<ProfileData>(context,listen: false);
    userData.profileData.sroreID=storeID;
    userData.profileData.storeImage=StoreImage;
    editstore.storedatato.storeName=storeName;
    editstore.storedatato.phone=phone;
    editstore.storedatato.whatsapp=whatsapp;
    editstore.storedatato.address=address;
    editstore.storedatato.facebook=facebook;
    editstore.storedatato.instagram=instagram;
    editstore.storedatato.website=website;
    editstore.storedatato.description=description;
    editstore.storedatato.type=type;
    preferences.setString("storename", storeName);
    preferences.setString("storephone", phone);
    preferences.setString("storewhatsapp", whatsapp);
    preferences.setString("storeaddress", address);
    preferences.setString("facebook", facebook);
    preferences.setString("instagram", instagram);
    preferences.setString('website', website);
    preferences.setString('description', description);
    preferences.setString('type', type);
  }
}

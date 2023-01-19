import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/shared/components/product model.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/storeData.dart';
import '../../providers/userData.dart';
import '../../shared/components/MenuItems.dart';
import '../../shared/network/product/product.dart';
import '../../shared/utility/app_url.dart';
import '../add_Product/add_product1.dart';
import '../create_Store/Create_Store.dart';
import '../sellerSettings/seller_Settings.dart';
import '../settings/language.dart';
import 'drawerScreen.dart';

class MyStore extends DrawerContent {
  MyStore({Key key, this.title});

  final String title;

  @override
  _MyStoreState createState() => _MyStoreState();
}

//Main Page(Home)
class _MyStoreState extends State<MyStore> {
  String token = '',
      name = '',
      email = '',
      profile_img = '',
      last_seen = '';
  int rating = 0;

  @override
  void initState() {
    super.initState();
    getCred();
    GetStoreAPI();
    getuserData();
  }

  void getCred() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      token = preferences.getString("Token");
      name = preferences.getString('name');
      email = preferences.getString('email');
      profile_img = preferences.getString('Profile_Image');
      last_seen = preferences.getString('last_seen');
    });
  }

  Widget build(BuildContext context) {
    var _lang = Provider.of<Language>(context);
    return Scaffold(
      extendBody: true,

      ///AppBar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        ///Title of Home Screen
        title: Text(
          _lang.tMyStore(),
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
              onPressed: widget.onMenuPressed,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 30, 0),
            child: IconButton(
              icon: Icon(
                Icons.settings_sharp,
                color: Color(0xff6a45ff),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Seller_Settings()));
              },
            ),
          ),
        ],
      ),

      ///body of Home Screen
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                    child: Container(
                      width: 150,
                      height: 41,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Color.fromRGBO(140, 106, 255, 10),
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Add_Product()));
                        },
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Color.fromRGBO(140, 106, 255, 10),
                              ),
                              SizedBox(width: 5),
                              Text(
                                _lang.tAddProduct(),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(140, 106, 255, 10),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          ///Product Model
          ///
          FutureBuilder(
              future: GetStoreAPI(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  else if (snapshot.hasData) {
                    print("In model");
                    return Model();
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
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

  void saveStoredata(int storeID,
      String StoreImage,
      String storeName,
      String phone,
      String whatsapp,
      String address,
      String facebook,
      String instagram,
      String website,
      String description,
      String type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final editstore = Provider.of<Storedatato>(context, listen: false);
    final userData = Provider.of<ProfileData>(context, listen: false);
    userData.profileData.sroreID = storeID;
    userData.profileData.storeImage = StoreImage;
    editstore.storedatato.storeName = storeName;
    editstore.storedatato.phone = phone;
    editstore.storedatato.whatsapp = whatsapp;
    editstore.storedatato.address = address;
    editstore.storedatato.facebook = facebook;
    editstore.storedatato.instagram = instagram;
    editstore.storedatato.website = website;
    editstore.storedatato.description = description;
    editstore.storedatato.type = type;
    preferences.setInt("storeID", storeID);
    preferences.setString("storename", storeName);
    preferences.setString("storeImg", StoreImage);
    preferences.setString("storephone", phone);
    preferences.setString("storewhatsapp", whatsapp);
    preferences.setString("storeaddress", address);
    preferences.setString("facebook", facebook);
    preferences.setString("instagram", instagram);
    preferences.setString('website', website);
    preferences.setString('description', description);
    preferences.setString('type', type);
  }

  Future<List<Product>> GetStoreAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final productData = Provider.of<Storedatato>(context, listen: false);
    String Token = preferences.getString("Authorize");
    int Store_id = preferences.getInt("store_id");
    //  print('This is ID: $Store_id');
    String createstore = AppUrl.createStore + '/$Store_id';
    if (Store_id != null) {
      Response response = await http.get(
        Uri.parse(createstore),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
          'Authorization': 'Bearer $Token',
        },
      );
      var _data = jsonDecode(response.body);
      productData.storedatato.ProductLength = _data['productsLength'];

      // print(length);

      if (response.statusCode == 200) {
        var store = _data['store'];
        var length = _data['productsLength'];
        var product = _data['products'];
        print('This is : $product');
        List<Product> products = [];
        for (int i = 0; i < length; i++) {
          products.add(Product.fromJson(product[i]));
        }

        if (length == 0) {
          print('No product found');
        }
        productData.storedatato.product = products;

        saveStoredata(
            store['id'],
            store['logo'],
            store['name'],
            store['phone'],
            store['whatsapp'],
            store['address'],
            store['facebook'],
            store['instagram'],
            store['website'],
            store['description'],
            store['niche_market']);
        // print(store['logo']);
        return products;

        // throw Exception("Custom Error");

      } else {
        print(_data);
        print('Store retrive error!');
        //  _showErrorToast('Something went Wrong');
        throw Exception("Failed to load products!");
      }
    }
  }

}
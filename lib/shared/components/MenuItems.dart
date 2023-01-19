import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/Home/drawerScreen.dart';
import 'package:sale_hunter/modules/Home/myStore.dart';
import 'package:sale_hunter/modules/Home/profile.dart';
import 'package:sale_hunter/modules/settings/Settings.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/create_Store/Create_Store.dart';
import '../../modules/help/about_us.dart';

class MenuItems extends StatefulWidget {
  MenuItems({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MenuItemsState createState() => _MenuItemsState();
}
void getStoreId(int storeid)async{
  SharedPreferences preference = await SharedPreferences.getInstance();
  storeid=preference.getInt('store_id');
  print('This is:$storeid');
}
class _MenuItemsState extends State<MenuItems> with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;
  String email,last_seen,name,profile_img;
  //SideMenu items
  @override
  void initState() {
    super.initState();
    getCred();
    _drawerController = HiddenDrawerController(
      initialPage:MyStore(
        title: 'main',
      ),
      items: [

        ///Profile
        DrawerItem(
          text: Text(
            'Profile',
            style: TextStyle(color: Colors.white,fontSize: 25.0),
          ),
          icon: Image.asset('assets/images/profil.png'),
          onPressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Profile()));
          },

        ),

        ///Settings
        DrawerItem(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white,fontSize: 25.0),
          ),
          icon: Image.asset('assets/images/setting.png'),
          onPressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Settings_Screen()));
          },
        ),

        ///Help
        DrawerItem(
          text: Text(
            'About Us',
            style: TextStyle(color: Colors.white,fontSize: 25.0),
          ),
          icon: Image.asset('assets/images/help.png'),
          onPressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => aboutUs()));
          },

        ),

        ///SignOut
        DrawerItem(
          text: Text(
            'Sign Out',
            style: TextStyle(color: Colors.white,fontSize: 25.0),
          ),
          icon: Image.asset('assets/images/sign-out.png'),
          onPressed: ()async{
            SharedPreferences preferences = await SharedPreferences.getInstance();
            for(String key in preferences.getKeys()) {
              if(key != "language") {
                preferences.remove(key);
              }
            }
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Sign_In_Screen()),(route)=>false);
          },
        ),

        ///create store

  // DrawerItem(
  //   text: Text(
  //     '',
  //     style: TextStyle(color: Colors.white,fontSize: 25.0),
  //   ),
  //   icon: Image.asset('assets/images/createstore.png'),
  //   onPressed: (){
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (_) => Create_Store()));
  //   },
  // ),
      ],
    );
  }


  ////SideMenu Header (Avatar and profile Sam smith)
  @override
  Widget build(BuildContext context) {
    final userdata =Provider.of<ProfileData>(context,listen: false);
    userdata.profileData.nameedit=name;
    userdata.profileData.imageUrl=profile_img;
    final nametochange =userdata.profileData.nameedit;
    final imagetochange =userdata.profileData.imageUrl;
    return Scaffold(
      body: HiddenDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.topLeft,

          child: Column(
            children: <Widget>[
              SizedBox(height: 110),
              Container(
                height: 110,
                width: 110,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    imagetochange!=null
                        ?CircleAvatar(backgroundImage: NetworkImage('$imagetochange')):CircleAvatar(backgroundImage: AssetImage('assets/images/Sam.png'),),],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$nametochange',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$email',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xff7540fc),
        ),
      ),

    );
  }
  void getCred()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name=preferences.getString('fullname');
      email=preferences.getString('email');
      profile_img=preferences.getString('ProfileImage');
      last_seen=preferences.getString('last_seen');
    });
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
}
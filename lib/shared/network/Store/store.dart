import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:sale_hunter/modules/create_Store/Create_Store.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  ///Update Store
  // Future<void> UpdateStore(
  //     String name,
  //     String phone,
  //     String whatsapp,
  //     String address,
  //     String type,
  //     String facebook,
  //     String instagram,
  //     String website,
  //     String description) async {
  // //  final editestore = Provider.of<Storedatato>(context, listen: false);
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String BaseStoreImage = preferences.getString("Base64_Storeimage");
  //   String Token = preferences.getString("Authorize");
  //   String Store_id = preferences.getString("store_id");
  //   Map data = {
  //     'logo':'data:image/png;base64,$BaseStoreImage',
  //     'name': name,
  //     'phone': phone,
  //     'whatsapp': whatsapp,
  //     'address': address,
  //     'niche_market': type,
  //     'facebook': facebook,
  //     'instagram': instagram,
  //     'website': website,
  //     'description': description,
  //     'latitude': 30.064329,
  //     'longitude': 31.2193658,
  //   };
  //   print(data.toString());
  //   print(Store_id);
  //   String updatestore = AppUrl.createStore + '/77';
  //   Response response = await http.patch(
  //     Uri.parse(updatestore),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'client': 'mobile',
  //       'Authorization': 'Bearer $Token',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   var _data = jsonDecode(response.body);
  //   String message = _data['message'];
  //
  //
  //   if (response.statusCode == 200) {
  //     var store = _data['store'];
  //     preferences.setString("Store_Image", store['logo']);
  //
  //     // saveStoredata(store['id'],store['name'],store['phone'],store['whatsapp'],store['address'],store['facebook'],store['instagram'],store['website'],store['description'],store['niche_market']);
  //     print('Store Created');
  //     print(_data);
  //     // _showToast(message);
  //     // userdata.profileData.storeID =store['id'] ;
  //
  //   } else {
  //     // _showErrorToast(message);
  //     print(_data);
  //     print('Error ');
  //   }
  // }

  ///Delete Store

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
      print('Store Deleted');
    } else {
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
      DeleteStoreAPI();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => Create_Store()),
      //  );
      print('Correct Password');
    }
    else{
      print('Password incorrect');
    }
  }
}

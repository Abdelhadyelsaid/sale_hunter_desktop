import 'package:flutter/foundation.dart';

import '../shared/network/product/product.dart';

class StoreData with ChangeNotifier {

  String storeName;
  String phone;
  String whatsapp;
  String address;
  String facebook;
  String instagram;
  String description;
  String type;
  String website;
  int ProductLength;
  List <Product> product;
  String ProDesEn,ProDesAr;


  StoreData({
    @required this.storeName,
    @required this.phone,
    @required this.whatsapp,
    @required this.address,
    @required this.facebook,
    @required this.description,
    @required this.instagram,
    @required this.website,
    @required this.type,
    this.ProductLength,
    this.product,
    this.ProDesAr,
    this.ProDesEn
      } );
}

class Storedatato with ChangeNotifier{
  StoreData _storeData = new StoreData(
      storeName:'',
      phone:'',
      whatsapp:'',
      address:'',
      facebook:'',
      description:'',
      instagram:'',
      website:'',
      type:'',
    ProductLength:0,
    product:[],
    ProDesAr: "",
    ProDesEn: ""
  );
  StoreData get storedatato{
    return _storeData;
  }
  void storedata(StoreData data){

    _storeData.website=data.website;
    _storeData.instagram=data.instagram;
    _storeData.description=data.description;
    _storeData.facebook=data.facebook;
    _storeData.address=data.address;
    _storeData.whatsapp=data.whatsapp;
    _storeData.phone=data.phone;
    _storeData.storeName=data.storeName;
   _storeData.type=data.type;
   _storeData.ProductLength=data.ProductLength;
   _storeData.product=data.product;
   _storeData.ProDesEn=data.ProDesEn;
   _storeData.ProDesAr=data.ProDesAr;
    notifyListeners();
  }

}

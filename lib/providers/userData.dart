import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class userData with ChangeNotifier {
  String nameedit;
  String imageUrl;
  int sroreID;
  String storeImage;

  userData({
    @required this.nameedit,
    @required this.imageUrl,
    this.sroreID,
    this.storeImage,

  });

}

class ProfileData with ChangeNotifier{
  userData _userData = new userData(
    nameedit: "",
    imageUrl: "",
    sroreID: null,
    storeImage: "",
  );
  userData get profileData{
    return _userData;
  }
  void profiledata(userData data){
    _userData.nameedit=data.nameedit;
    _userData.imageUrl =data.imageUrl;
    _userData.sroreID =data.sroreID;
    _userData.storeImage =data.storeImage;
    notifyListeners();
  }

}

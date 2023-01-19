import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Store_Picture extends StatefulWidget {
  const Store_Picture({Key key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Store_Picture> {
  bool fav = true;
  File myfile;
  String store_img='';

  void initState(){
    super.initState();
    //getCred();
  }
  @override
  Widget build(BuildContext context) {
    final userdata =Provider.of<ProfileData>(context,listen: false);
    final StoreImg =userdata.profileData.storeImage;
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        fit: StackFit.expand,
        children: [

          ///image of profile
          if (myfile != null && StoreImg == null) ...[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.file(
                myfile,
                width: 100,
                height: 100,
              ),
            ),
          ] else if (myfile == null && StoreImg != null) ...[
            CircleAvatar(
              backgroundImage: NetworkImage('$StoreImg'),
            ),
          ]
          else if (myfile != null && StoreImg != null) ...[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.file(
                  myfile,
                  width: 100,
                  height: 100,
                ),
              ),
            ]
            else ...[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Sam.png'),
                ),
              ],

          ///buttom of add image
          Positioned(
            right: -20,
            bottom: -20,
            child: SizedBox(
              height: 70,
              width: 70,
              child: IconButton(
                onPressed: () async{
                  FilePickerCross myFile = await FilePickerCross.importFromStorage(
                      type: FileTypeCross.any,       // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                      fileExtension: '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff'     // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                  );
                  final imageTemp = File(myFile.path);
                  setState(() => this.myfile = imageTemp);
                  var base_image=myFile.toBase64();
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString("Base_StoreImage", base_image);
                  print (base_image);
                  print("-----------------------------------");
                },
                icon: Image.asset('assets/images/add.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // void getCred()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final userdata =Provider.of<ProfileData>(context,listen: false);
  //   setState(() {
  //     store_img=preferences.getString('storeImg');
  //   //  userdata.profileData.storeImage=store_img;
  //   });
  // }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_Picture extends StatefulWidget {
  const Profile_Picture({Key key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Profile_Picture> {
  bool fav = true;
  File myfile;
  String profile_img = '';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userdata =Provider.of<ProfileData>(context,listen: false);
    final imagetochange =userdata.profileData.imageUrl;
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ///image of profile
          if (myfile != null && imagetochange == null) ...[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.file(
                myfile,
                width: 100,
                height: 100,
              ),
            ),
          ] else if (myfile == null && imagetochange != null) ...[
            CircleAvatar(
              backgroundImage: NetworkImage('$imagetochange'),
            ),
          ]
          else if (myfile != null && imagetochange != null) ...[
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
                onPressed: () async {
                  FilePickerCross myFile =
                      await FilePickerCross.importFromStorage(
                          type: FileTypeCross.any,
                          fileExtension:
                              '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff',// Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                          );
                  final imageTemp = File(myFile.path);
                  setState(() => this.myfile = imageTemp);
                  var base_image = myFile.toBase64();
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setString("Base64_image", base_image);
                  print(base_image);
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

}

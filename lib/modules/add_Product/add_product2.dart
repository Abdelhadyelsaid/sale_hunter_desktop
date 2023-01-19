import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/add_Product/add_product3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/components/MenuItems.dart';
import '../../shared/style/text.dart';
import '../settings/language.dart';
import 'add_product1.dart';

class Add_Product2 extends StatefulWidget {
  const Add_Product2({Key key}) : super(key: key);

  @override
  State<Add_Product2> createState() => _Add_ProductState2();
}

class _Add_ProductState2 extends State<Add_Product2> {
  File productImg1, productImg2, productImg3;

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
          _lang.tAddProduct(),
          style: MyTextStyle.header,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                ///IMAGE BAR
                Center(
                  child: Container(
                    width: 1000.0,
                    height: 50.0,
                    child: Image(
                      image: AssetImage('assets/images/productbar2.png'),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 700.0,
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          child: Text(
                            _lang.tBaseI(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(159, 159, 159, 100),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 190.0,
                        ),
                        Container(
                          width: 110.0,
                          child: Text(
                            _lang.tPROIMG(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(255, 79, 4, 10),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 220.0,
                        ),
                        Container(
                          width: 70.0,
                          child: Text(
                            _lang.tMETADATA(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(159, 159, 159, 100),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                ///product image
                Center(
                  child: Container(
                    width: 800.0,
                    child: Text(
                      _lang.tProimg(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                ///Upload product image
                Center(
                  child: Container(
                    width: 800.0,
                    child: Text(
                      _lang.tUploadimg(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(159, 159, 159, 100),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),

                ///box of upload images
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      dashPattern: [6, 3, 2, 3],
                      color: Color.fromRGBO(159, 159, 159, 100),
                      child: Stack(
                        // fit:StackFit.expand,
                        children: [
                          Center(
                            child: Container(
                              width: 300,
                              height: 200,
                              child: Center(
                                child: TextButton(
                                  onPressed: () async {
                                    FilePickerCross myFile1 =
                                        await FilePickerCross.importFromStorage(
                                            type: FileTypeCross.any,
                                            // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                            fileExtension:
                                            '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                            );
                                    final imageTemp1 = File(myFile1.path);
                                    print(myFile1.path);
                                    setState(
                                        () => this.productImg1 = imageTemp1);
                                    var base_image1 = myFile1.toBase64();
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage1", base_image1);
                                    print(base_image1);
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff643df8),
                                      fontSize: 60,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  // icon: Image.asset('assets/images/add.png'),
                                ),
                              ),
                            ),
                          ),
                          if (productImg1 != null) ...[
                            Center(
                              child: Container(
                                width: 300,
                                height: 200,
                                child: Image.file(
                                  productImg1,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 6,
                                right: 6,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    FilePickerCross myFile1 =
                                    await FilePickerCross.importFromStorage(
                                        type: FileTypeCross.any,
                                        // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                        fileExtension:
                                        '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                    );
                                    final imageTemp1 = File(myFile1.path);
                                    print(myFile1.path);
                                    setState(
                                            () => this.productImg1 = imageTemp1);
                                    var base_image1 = myFile1.toBase64();
                                    SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage1", base_image1);
                                    print(base_image1);
                                  },
                                ))
                          ],
                        ],
                      ),
                    ),
                    DottedBorder(
                      dashPattern: [6, 3, 2, 3],
                      color: Color.fromRGBO(159, 159, 159, 100),
                      child: Stack(
                        // fit:StackFit.expand,
                        children: [
                          Center(
                            child: Container(
                              width: 300,
                              height: 200,
                              child: Center(
                                child: TextButton(
                                  onPressed: () async {
                                    FilePickerCross myFile2 =
                                        await FilePickerCross.importFromStorage(
                                            type: FileTypeCross.any,
                                            // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                            fileExtension:
                                            '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                            );
                                    final imageTemp2 = File(myFile2.path);
                                    print(myFile2.path);
                                    setState(
                                        () => this.productImg2 = imageTemp2);
                                    var base_image1 = myFile2.toBase64();
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage2", base_image1);
                                    print(base_image1);
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff643df8),
                                      fontSize: 60,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  // icon: Image.asset('assets/images/add.png'),
                                ),
                              ),
                            ),
                          ),
                          if (productImg2 != null) ...[
                            Center(
                              child: Container(
                                width: 300,
                                height: 200,
                                child: Image.file(
                                  productImg2,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 6,
                                right: 6,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    FilePickerCross myFile2 =
                                    await FilePickerCross.importFromStorage(
                                        type: FileTypeCross.any,
                                        // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                        fileExtension:
                                        '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                    );
                                    final imageTemp2 = File(myFile2.path);
                                    print(myFile2.path);
                                    setState(
                                            () => this.productImg2 = imageTemp2);
                                    var base_image1 = myFile2.toBase64();
                                    SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage2", base_image1);
                                    print(base_image1);
                                  },
                                ))
                          ],
                        ],
                      ),
                    ),
                    DottedBorder(
                      dashPattern: [6, 3, 2, 3],
                      color: Color.fromRGBO(159, 159, 159, 100),
                      child: Stack(
                        // fit:StackFit.expand,
                        children: [
                          Center(
                            child: Container(
                              width: 300,
                              height: 200,
                              child: Center(
                                child: TextButton(
                                  onPressed: () async {
                                    FilePickerCross myFile3 =
                                        await FilePickerCross.importFromStorage(
                                            type: FileTypeCross.any,
                                            // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                            fileExtension:
                                            '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                            );
                                    final imageTemp3 = File(myFile3.path);
                                    print(myFile3.path);
                                    setState(
                                        () => this.productImg3 = imageTemp3);
                                    var base_image1 = myFile3.toBase64();
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage3", base_image1);
                                    print(base_image1);
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff643df8),
                                      fontSize: 60,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  // icon: Image.asset('assets/images/add.png'),
                                ),
                              ),
                            ),
                          ),
                          if (productImg3 != null) ...[
                            Center(
                              child: Container(
                                width: 300,
                                height: 200,
                                child: Image.file(
                                  productImg3,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 6,
                                right: 6,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    FilePickerCross myFile3 =
                                    await FilePickerCross.importFromStorage(
                                        type: FileTypeCross.any,
                                        // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                                        fileExtension:
                                        '.jpg,.jpeg,.png,.jfif,.pjpeg,.pjp,.svg,.webp,.ico,.tif,.tiff' // Only if FileTypeCross.custom . May be any file extension like `.dot`, `.ppt,.pptx,.odp`
                                    );
                                    final imageTemp3 = File(myFile3.path);
                                    print(myFile3.path);
                                    setState(
                                            () => this.productImg3 = imageTemp3);
                                    var base_image1 = myFile3.toBase64();
                                    SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                    preferences.setString(
                                        "productimage3", base_image1);
                                    print(base_image1);
                                  },
                                ))
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),

                ///next and previous buttoms
                Container(
                  width: 800,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add_Product()),
                          );
                        },
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/backIcon.png'),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              _lang.tPrevious(),
                              style: MyTextStyle.skip,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 600.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add_Product3()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              _lang.tNext(),
                              style: MyTextStyle.skip,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Image(
                              image: AssetImage(
                                  'assets/images/forward.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

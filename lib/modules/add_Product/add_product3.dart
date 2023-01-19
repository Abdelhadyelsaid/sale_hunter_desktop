import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/add_Product/add_product2.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/components/MenuItems.dart';
import '../../shared/components/Rounded_bottom.dart';
import '../../shared/style/text.dart';
import '../Home/myStore.dart';
import '../settings/language.dart';

class Add_Product3 extends StatefulWidget {
  const Add_Product3({Key key}) : super(key: key);

  @override
  State<Add_Product3> createState() => _Add_ProductState3();
}

class _Add_ProductState3 extends State<Add_Product3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _brandController = new TextEditingController();
  final TextEditingController _desArController = new TextEditingController();
  final TextEditingController _desEnController = new TextEditingController();

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
                      image: AssetImage('assets/images/productbar3.png'),
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
                              color: Color.fromRGBO(159, 159, 159, 100),
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
                              color: Color.fromRGBO(255, 79, 4, 10),
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

                ///Meta Data
                Center(
                  child: Container(
                    width: 1000.0,
                    child: Text(
                      _lang.tMetaData(),
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

                ///Fill Info
                Center(
                  child: Container(
                    width: 1000.0,
                    child: Text(
                      _lang.tFillInfo(),
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
                  height: 30.0,
                ),

                ///Form
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _lang.tBrand(),
                            style: MyTextStyle.textform,
                          ),
                        ),
                        Container(
                          width: 1000,
                          child: TextFormField(
                            controller: _brandController,
                            style: MyTextStyle.textform,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0x07000000),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff8743ff)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Text ! ';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),

                        ///English description
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _lang.tProductDesEn(),
                            style: MyTextStyle.textform,
                          ),
                        ),
                        Container(
                          width: 1000,
                          height: 120.0,
                          child: TextFormField(
                            maxLines: 10,
                            minLines: 10,
                            controller: _desEnController,
                            style: MyTextStyle.textform,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0x07000000),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff8743ff)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Text ! ';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),

                        ///Arabic description
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _lang.tProductDesAr(),
                            style: MyTextStyle.textform,
                          ),
                        ),
                        Container(
                          width: 1000,
                          height: 120.0,
                          child: TextFormField(
                            maxLines: 10,
                            minLines: 10,
                            controller: _desArController,
                            style: MyTextStyle.textform,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0x07000000),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff8743ff)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Text ! ';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),

                        ///previous buttom
                        Container(
                          width: 1000,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Add_Product2()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/backIcon.png'),
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
                                width: 480,
                              ),

                              ///save Buttom
                              Container(
                                width: 200,
                                height: 56,
                                child: Rounded_Bottom(
                                  func: () {
                                    print('clicked!');
                                    if (_formKey.currentState.validate()) {
                                      CreateProduct(
                                          _brandController.text,
                                          _desEnController.text,
                                          _desArController.text);
                                    }
                                  },
                                  hintText: _lang.tSave(),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              /// cancel buttom
                              Container(
                                width: 200,
                                height: 56,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Color.fromRGBO(79, 57, 244, 10),
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyStore()),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      _lang.tCancel(),
                                      style: MyTextStyle.skip,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> CreateProduct(String brand, String DesEn, String DesAr) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String BaseProductImage1 = preferences.getString("productimage1");
    String BaseProductImage2 = preferences.getString("productimage2");
    String BaseProductImage3 = preferences.getString("productimage3");
    String title = preferences.getString("productNameEn");
    String title_ar = preferences.getString("productNameAr");
    int price = preferences.getInt("poductPrice");
    int sale = preferences.getInt("poductSale");
    String Category = preferences.getString("productCatEn");
    String Category_ar = preferences.getString("productCatAr");
    String Token = preferences.getString("Authorize");
    preferences.setString("brand", brand);
    preferences.setString("DescriptionEn", DesEn);
    preferences.setString("DescriptionAr", DesAr);

    Map data = {
      "title": title,
      "title_ar": title_ar,
      "sale": sale,
      "description": DesEn,
      "description_ar": DesAr,
      "price": price,
      "brand": brand,
      "category": DesEn,
      "category_ar": DesAr,
      "product_images": [
        "data:image/jpeg;base64,$BaseProductImage1",
        "data:image/jpeg;base64,$BaseProductImage2",
        "data:image/jpeg;base64,$BaseProductImage3",
      ]};
    //   print(data.toString());

    int store_id = preferences.getInt("store_id");
    print(store_id);
    String creteproduct = AppUrl.baseUrl + 'products?storeId=159';
    print(creteproduct);
    Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'client': 'mobile',
          'Authorization': 'Bearer $Token',
          "Accept":"application/json"
        },
      ),
    );

    var dioClient = Dio();
    dioClient.interceptors.add(InterceptorsWrapper(
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioError e, handler) {
          if (e.response != null) {
            // use the handler to propagate error
            handler.reject(e);
          }
        }));
    dio.interceptors.addAll([
      LogInterceptor(responseBody: true, requestBody: true),

    ]);
    Response response;
    try {
      response = await dio.post(
        creteproduct,
        data: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }
        ),
      );
      if (response.statusCode == 201) {
        var _data = response.data;
        print('Product Created');
        print(_data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyStore()),
        );
      }
    } on DioError catch (error) {
      print('Product Error');

    }
  }

}

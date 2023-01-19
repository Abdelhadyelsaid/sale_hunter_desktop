
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/components/MenuItems.dart';
import '../../shared/style/text.dart';
import '../settings/language.dart';
import 'add_product2.dart';

class Add_Product extends StatefulWidget {
  const Add_Product({Key key}) : super(key: key);

  @override
  State<Add_Product> createState() => _Add_ProductState();
}

class _Add_ProductState extends State<Add_Product> {
  final _formKey = GlobalKey<FormState>();
  int price ,sale;
  final TextEditingController _productNameEnController = new TextEditingController();
  final TextEditingController _productNameArController = new TextEditingController();
  final TextEditingController _priceController = new TextEditingController();
  final TextEditingController _saleController = new TextEditingController();
  final TextEditingController _CategoryEnController = new TextEditingController();
  final TextEditingController _CategoryArController = new TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Image Bar
                Center(
                  child:Container(
                    width: 1000.0,
                    height: 50.0,
                    child: Image(
                      image: AssetImage('assets/images/productbar1.png'),
                    ),
                  ) ,
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
                              color: Color.fromRGBO(255, 79, 4, 10),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 190.0,),
                        Container(
                          width: 110.0,
                          child: Text(
                            _lang.tPROIMG(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(159,159, 159, 100),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 220.0,),
                        Container(
                          width: 70.0,
                          child: Text(
                            _lang.tMETADATA(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(159,159, 159, 100),
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
                SizedBox(height: 30.0,),
                ///Basic Info
                Center(
                  child: Container(
                    width: 1000.0,
                    child: Text(
                      _lang.tBasicInfo(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style:TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                ///Fill Info
                Center(
                  child: Container(
                    width: 1000.0,
                    child: Text(
                      _lang.tFillInfo(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style:TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(159,159, 159, 100),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                ///Form
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///product Name
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tProductNameEn(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    controller: _productNameEnController,
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///product Name
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tProductNameAr(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    controller: _productNameArController,
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Price
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tPrice(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    onChanged: (s) {
                                       price = int.parse(
                                          _priceController.text);
                                    },
                                    controller: _priceController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]+')),
                                    ],
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tSale(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    onChanged: (s) {
                                      sale = int.parse(
                                          _saleController.text);
                                    },
                                    controller: _saleController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]+')),
                                    ],
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Category
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tCategoryEn(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    controller: _CategoryEnController,
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _lang.tCategoryAr(),
                                    style: MyTextStyle.textform,
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    controller: _CategoryArController,
                                    style: MyTextStyle.textform,
                                    decoration: InputDecoration(
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
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Text ! ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ///Next Buttom
                        Container(
                          width: 1250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if(_formKey.currentState.validate()){
                                    saveproductdata(_productNameEnController.text, _productNameArController.text, price, sale, _CategoryEnController.text,_productNameArController.text);
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Add_Product2()),
                                  );}
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _lang.tNext(),
                                      style: MyTextStyle.skip,
                                    ),
                                    SizedBox(width: 5.0,),
                                    Image(
                                      image: AssetImage('assets/images/forward.png'),
                                    ),

                                  ],
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
  void saveproductdata(String productNameEn,String productNameAr,int price,int sale,String productCategoryEn,String productCategoryAr) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //final productData =Provider.of<ProfileData>(context,listen: false);
   // userData.profileData.sroreID=storeID;

    preferences.setString("productNameEn", productNameEn);
    preferences.setString("productNameAr", productNameAr);
    preferences.setInt("poductPrice", price);
    preferences.setInt("poductSale", sale);
    preferences.setString("productCatEn", productCategoryEn);
    preferences.setString("productCatAr", productCategoryAr);

  }
}

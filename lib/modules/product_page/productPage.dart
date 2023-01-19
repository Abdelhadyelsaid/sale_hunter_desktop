import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/shared/style/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/storeData.dart';
import '../../providers/userData.dart';
import '../../shared/components/MenuItems.dart';
import '../../shared/components/Rounded_bottom.dart';
import '../../shared/network/product/product.dart';
import '../../shared/utility/app_url.dart';
import '../settings/language.dart';

class productPage extends StatefulWidget {

  final String  title_En, title_Ar,images,Cat,Cat_Ar;
  final dynamic price, sale, id, rate;

  const productPage(
      {Key key,
      @required this.id,
      @required this.images,
      @required this.title_En,
      @required this.title_Ar,
      @required this.price,
      @required this.sale,
      @required this.rate, this.Cat, this.Cat_Ar});

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleEnController = new TextEditingController();
  final TextEditingController _titleArController = new TextEditingController();
  final TextEditingController _saleController = new TextEditingController();
  final TextEditingController _priceController = new TextEditingController();
  final TextEditingController _desArController = new TextEditingController();
  final TextEditingController _desEnController = new TextEditingController();

  double rating = 0.0;
  String value;
  bool fav = true;
  @override
  void initState() {
    super.initState();
  // getProduct();
  }
  @override
  Widget build(BuildContext context) {
    final productData =Provider.of<Storedatato>(context,listen: false);

    _titleArController.text = widget.title_Ar;
    _titleEnController.text = widget.title_En;
    _priceController.text = widget.price.toString();
    _saleController.text = widget.sale.toString();
    _desArController.text =  widget.Cat_Ar;
    _desEnController.text =  widget.Cat;

    final userdata = Provider.of<ProfileData>(context, listen: false);
    final StoreImg = userdata.profileData.storeImage;
    var _lang = Provider.of<Language>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            productData.storedatato.ProDesAr=null;
               productData.storedatato.ProDesEn=null;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuItems()),
            );
          },
          icon: Image.asset('assets/images/back.png'),
        ),
        title: Text(
          _lang.tpropage(),
          style: MyTextStyle.header,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///left container
              Column(
                children: [
                  /// Main photo of product
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: widget.images != null
                        ? Container(
                            width: 500,
                            height: 700,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.images),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Container(
                            width: 500,
                            height: 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/error.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                  ),

                  /// more small Photos
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(50, 40, 0, 0),
                  //   child: Container(
                  //     width: 500,
                  //     height: 200,
                  //     child: Wrap(
                  //       direction: Axis.horizontal,
                  //       runSpacing: 10.0,
                  //       children: List.generate(3, (index) {
                  //         return widget.images != null
                  //             ? TextButton(
                  //                 child: Container(
                  //                   width: 150,
                  //                   height: 100,
                  //                   decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                       image: NetworkImage(widget.images),
                  //                       fit: BoxFit.contain,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 onPressed: () {},
                  //               )
                  //             : TextButton(
                  //                 child: Container(
                  //                   width: 150,
                  //                   height: 100,
                  //                   decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                       image: AssetImage(
                  //                           "assets/images/error.png"),
                  //                       fit: BoxFit.contain,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 onPressed: () {},
                  //               );
                  //       }),
                  //     ),
                  //   ),
                  // ),
                ],
              ),

              SizedBox(
                width: 200,
              ),

              ///right container
              Form(
                key: _formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Sale Icon
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: 150.0,
                            child: TextFormField(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff8743ff)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0),
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
                          Container(
                            width: 150,
                            height: 70,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                ///لما تيجي تقرأ من الداتا بيز هنخليه يا خد الصوره منهم ونبقي نمسح الصور من الassets
                                image: AssetImage('assets/images/saleic.png'),
                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///name of product
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        children: [
                          ///name in english
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _lang.tProductNameEn(),
                                style: MyTextStyle.textform,

                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 400,
                                child: TextFormField(
                                  controller: _titleEnController,
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
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
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
                          SizedBox(
                            width: 40,
                          ),

                          ///name in arabic
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _lang.tProductNameAr(),
                                style: MyTextStyle.textform,

                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 400,
                                child: TextFormField(
                                  controller: _titleArController,
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
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
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
                    ),

                    ///price of product
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        children: [
                          ///Price After Sale
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _lang.tPrice(),
                                style: MyTextStyle.textform,
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 400,
                                child: TextFormField(
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
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xff8743ff)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
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
                          SizedBox(
                            width: 100.0,
                          ),

                          ///Logo
                          Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('$StoreImg'),
                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Rate of product
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        children: [
                          ///rate icon
                          RatingBar.builder(
                            initialRating: 0,
                            updateOnDrag: false,
                            minRating: 0,
                            itemSize: 30,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),

                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            ' 0',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    ///Description of product
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _lang.tProductDesEn(),
                            style: MyTextStyle.textform,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 800,
                            height: 150.0,
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
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0),
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
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            _lang.tProductDesAr(),
                            style: MyTextStyle.textform,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 800,
                            height: 150.0,
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
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0),
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
                    ),

                    /// Delete or Save product changes
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: 400,
                            height: 56,
                            child: Rounded_Bottom(
                              hintText: _lang.tUpdateStore(),
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  UpdateProduct();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),

                          ///Delete Buttom
                          Container(
                            width: 400,
                            height: 56,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Color.fromRGBO(255, 79, 4, 10),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              // color:Color.fromRGBO(255, 79, 4, 30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                DeleteProduct();
                              },
                              child: Center(
                                child: Text(
                                  _lang.tdelPro(),
                                  style: MyTextStyle.deletefont,
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
            ],
          ),
        ],
      )),
    );
  }


  Future<void> DeleteProduct() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String Token = preferences.getString("Authorize");
    int Store_id = preferences.getInt("store_id");

    print('This is ID: $Store_id');
    String deleteproduct =
        AppUrl.deleteProduct + '${widget.id}?storeId=$Store_id';
    Response response = await http.delete(
      Uri.parse(deleteproduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'client': 'mobile',
        'Authorization': 'Bearer $Token',
      },
    );
    if (response.statusCode == 204) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuItems()),
      );
      // _showToast("Store deleted successfully !");
      print('Product Deleted');
    } else {
      print('Something went Wrong');
    }
  }

  Future<void> UpdateProduct() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final productData =Provider.of<Storedatato>(context,listen: false);
    String Token = preferences.getString("Authorize");
    Map data = {
      'title': _titleEnController.text,
      'title_ar': _titleArController.text,
      'sale': int.parse(_saleController.text),
      'description': _desEnController.text,
      'description_ar': _desArController.text,
      'price': int.parse(_priceController.text),
    };
    print(data.toString());

    int store_id = preferences.getInt("store_id");
    String updateProduct =
        AppUrl.updateProduct + '${widget.id}?storeId=$store_id';
    print(updateProduct);
    Response response = await http.patch(
      Uri.parse(updateProduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'client': 'mobile',
        'Authorization': 'Bearer $Token',
      },
      body: jsonEncode(data),
    );
    var _data = jsonDecode(response.body);
    String message = _data['message'];

    if (response.statusCode == 200) {
       productData.storedatato.ProDesEn= _desEnController.text ;
       productData.storedatato.ProDesAr= _desArController.text;

      print('Product Update!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuItems()),
      );
      print(message);
      print(_data);
    } else {
      // _showErrorToast(message);
      print(message);
      print(_data);
      print('Error ');
    }
  }

  // Future<void> getProduct() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final productData =Provider.of<Storedatato>(context,listen: false);
  //
  //   int Store_id = preferences.getInt("store_id");
  //
  //   print('This is ID: $Store_id');
  //   String deleteproduct =
  //       AppUrl.getProduct + '${widget.id}';
  //   Response response = await http.get(
  //     Uri.parse(deleteproduct),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'client': 'mobile',
  //     },
  //   );
  //   var _data =jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     var basic=_data['product']['basic'];
  //     var Desen=basic['product_description'];
  //     var Desar=basic['product_description_ar'];
  //     productData.storedatato.ProDesEn=Desen;
  //     productData.storedatato.ProDesAr=Desar;
  //
  //   } else {
  //     print('Something went Wrong');
  //   }
  // }
}

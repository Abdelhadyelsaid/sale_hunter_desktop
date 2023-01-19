import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/product_page/productPage.dart';
import 'package:sale_hunter/providers/productData.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/shared/network/product/product.dart';
import 'package:sale_hunter/shared/utility/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/userData.dart';
class Model extends StatefulWidget {

  @override
  State<Model> createState() => _ModelState();
}



class _ModelState extends State<Model> {
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Storedatato>(context, listen: false);
    final userdata =Provider.of<ProfileData>(context,listen: false);
    final StoreImg =userdata.profileData.storeImage;
    int length = productData.storedatato.ProductLength;
    List <Product>products =productData.storedatato.product;
    return Center(
      child: Wrap(
          children: List.generate(length, (index) {
            return Card(
              elevation: 2,
              child: Column(
                children: <Widget>[
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => productPage(
                          rate: 0,
                          id: products[index].id,
                          images: products[index].image,
                          price: products[index].price,
                          sale:products[index].sale ,
                          title_En:products[index].title ,
                          title_Ar:products[index].title_ar ,
                          Cat:products[index].category,
                          Cat_Ar:products[index].category_ar ,

                        )),
                      );
                    },
                    child: Container(
                      width: 600 / 2,
                      height: 390,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ///Image of product
                          Padding(
                            padding: const  EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Stack(
                              children:[products[index].image !=null?Center(
                                  child: Container(
                                    height: 190,
                                    child: Image(
                                      image: NetworkImage(products[index].image),
                                    ),
                                  ),
                              ):Center(
                                child: Container(
                                  height: 190,
                                  child: Image(
                                    image: AssetImage("assets/images/error.png"),
                                  ),
                                ),
                              ),
                                if(products[index].sale>0) ...[Positioned(
                                    top:25, right: 20,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor:Color.fromRGBO(255, 79, 4, 10),
                                      child: Text(
                                          '${products[index].sale}%'
                                      ),
                                    ))],
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          ///Brand of product
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              products[index].brand,
                              style: TextStyle(
                                color: Color(0xffff4f04),
                                //fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),

                          ///name of ptoduct and its price
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                //name of product

                                Flexible(
                                  child: Text(
                                    products[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.0,
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                                //price of product
                                //ال $ مش نافعه تتكتب مع الtext
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: [
                                //انا مخليه نجوم ال rate صوره ....لما نشوف هتتعمل ازاي في الdatabase هبقي اعدلها لو مش هتبقي صوره
                                RatingBar.builder(
                                  updateOnDrag: false,
                                  initialRating: 0 ,
                                  minRating: 0,
                                  itemSize: 15,
                                  itemBuilder: (context , _) => Icon(Icons.star, color: Colors.amber,),
                                ),
                                //هنا الرقم بتاع ال rate نفسه
                                Text('   ${ 0}',
                                    style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                    color: Colors.black
                                ),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                //Logo of jumia or amazon
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Row(
                              children: [
                                Text(
                                  "${products[index].price} L.E",
                                  style: TextStyle(
                                    color: Color(0xffff4f04),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 130),
                                Container(
                                  height: 50,
                                 width: 50,
                                 child: Image.network('$StoreImg'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            );
          })
      ),
    );
  }

  Future<void> GetStoreAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final productData =Provider.of<Storedatato>(context,listen: false);
    String Token = preferences.getString("Authorize");
    int Store_id = preferences.getInt("store_id");
    print('This is ID: $Store_id');
    String createstore = AppUrl.createStore + '/$Store_id';
    Response response = await http.get(
      Uri.parse(createstore),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'client': 'mobile',
        'Authorization': 'Bearer $Token',
      },
    );
    var _data = jsonDecode(response.body);
    productData.storedatato.ProductLength =_data['productsLength'];

    // print(length);


    if (response.statusCode == 200) {

      var store =_data['store'];
      var length = _data['productsLength'];

      var product =_data['products'];
      List <Product> products=[];
      for(int i =0;i<length;i++){
        products.add(
            Product.fromJson(product[i])
        );
      }
      if(length==0){
        print('No product found');
      }
      productData.storedatato.product =products;
      print(_data);
     // saveStoredata(store['id'],store['logo'],store['name'],store['phone'],store['whatsapp'],store['address'],store['facebook'],store['instagram'],store['website'],store['description'],store['niche_market']);
      // print(store['logo']);

    } else {
      print(_data);
      print('Store retrive error!');
      //  _showErrorToast('Something went Wrong');
      throw Exception("Failed to load movies!");

    }
  }
}
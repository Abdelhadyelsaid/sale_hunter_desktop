// import 'package:flutter/foundation.dart';
//
// class ProductData with ChangeNotifier{
//
//    int id;
//    int price;
//    int sale;
//    int rating;
//    int rating_count;
//    int is_favourite;
//    String title;
//    String title_ar;
//    String brand;
//    String category;
//    String category_ar;
//    String length;
//    String image;
//
//   ProductData({@required this.id, this.price, this.sale, this.rating, this.rating_count, this.is_favourite, this.title, this.title_ar, this.brand, this.category, this.category_ar, this.image, this.length});
// }
//
// class Productdatato with ChangeNotifier{
//   ProductData _productData = new ProductData(
//     length:'',
//     id:0,
//     price:0,
//     sale:0,
//     rating:0,
//     rating_count:0,
//     is_favourite:0,
//     title:'',
//     title_ar:'',
//     brand:'',
//     category:'',
//     category_ar:'',
//     image:'',
//   );
//   ProductData get productdatato{
//     return _productData;
//   }
//   void storedata(ProductData data){
//
//     _productData.length=data.length;
//     _productData.id=data.id;
//     // _productData.description=data.description;
//     // _productData.facebook=data.facebook;
//     // _productData.address=data.address;
//     // _productData.whatsapp=data.whatsapp;
//     // _productData.phone=data.phone;
//     // _productData.storeName=data.storeName;
//     // _productData.type=data.type;
//
//     notifyListeners();
//   }
//
// }
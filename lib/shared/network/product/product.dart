class Product{
  final dynamic id;
  final dynamic price;
  final dynamic sale;
  final dynamic rating;
  final dynamic rating_count;
  final dynamic is_favourite;
  final dynamic title;
  final dynamic title_ar;
  final dynamic brand;
  final dynamic category;
  final dynamic category_ar;
  final dynamic description_en;
  final dynamic description_ar;
  final dynamic image;


  Product({this.description_en, this.description_ar,   this.id, this.price, this.sale, this.rating,this.rating_count, this.is_favourite, this.title, this.title_ar, this.brand,this.category, this.category_ar, this.image});
  factory Product.fromJson(Map<String, dynamic> json){
    print(json);
    return Product(
        id: json['id'],
        price:json['price'],
        sale:json['sale'],
        rating:json['rating'] ?? 0,
        rating_count:json['rating_count'],
        is_favourite:json['is_favourite'],
        title: json['title'],
        title_ar:json['title_ar'],
        brand:json['brand'],
        category: json['category'],
        category_ar:json['category_ar'],
        image:json["image"],
        description_en: json['description'],
        description_ar: json['description_ar'],
       );
  }
}



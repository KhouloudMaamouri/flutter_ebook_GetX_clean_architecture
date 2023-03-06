import '../../domain/entities/books.dart';

class BooksModel extends Books {

  BooksModel({
    required String title,
    required String subtitle,
    required String isbn13,
    required String price,
    required String image,
    required String url,

  }): super(title: title, subtitle: subtitle, isbn13:isbn13, price:price, image:image, url:url);

  factory BooksModel.fromJson(Map<String, dynamic> json){
    return BooksModel(
      title : (json['title'] != null) ? json['title'] : "",
      subtitle: (json['subtitle'] != null) ? json['subtitle'] : "",
      isbn13: (json['isbn13'] != null) ? json['isbn13'] : "",
      price: (json['price'] != null) ? json['price'] : "",
      image: (json['image'] != null) ? json['image'] :"",
      url: (json['url'] != null) ? json['url'] :"",
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'subtitle': subtitle,
      'isbn13': isbn13,
      'price': price,
      'image': image,
      'url': url,
    };
  }
}
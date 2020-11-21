
import 'package:oscar/model/city.dart';
import 'package:oscar/model/categoryProductModel.dart';

class ProductModel {
  final String id;
  final String o_name;
  final String o_number;
  final String o_idnumber;
  final String createdDate;
  final String image;
  final String imagee;
   final String imageee;
    final String imageeee;
  final String status;
  final String description;
  final String ctiy;
  final  String cat;
  ProductModel(
      {this.id,
      this.o_name,
      this.o_number,
      this.o_idnumber,
      this.createdDate,
      this.image,
      this.imagee,
      this.imageee,
      this.imageeee,
      this.status,
      this.description,
      this.ctiy,
      this.cat});

  fromJson(Map json) {
    return ProductModel(
      id: json['id'],
      ctiy: json['cat_title'],
      cat: json['CategoryName'],
      o_name: json['o_name'],
      o_number: json['o_number'],
      o_idnumber: json['o_idnumber'],
      createdDate: json['createdDate'],
      image: json['image'],
      imagee: json['imagee'],
      imageee: json['imageee'],
      imageeee: json['imageeee'],
      status: json['status'],
      description: json['description'],
    );
  }
}

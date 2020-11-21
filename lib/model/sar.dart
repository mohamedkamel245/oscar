
import 'package:oscar/model/categoryProductModel.dart';
import 'package:oscar/model/city.dart';

class Sar {
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
  final List<City> ctiy;
  final List<CategoryProductModel> cat;
  Sar(
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

  factory Sar.fromJson(Map<String, dynamic> json) {
    return Sar(
      id: json['id'],
      ctiy: json['cat_title'],
      cat: json['categoryName'],
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
import 'package:oscar/model/productModel.dart';

class CategoryProductModel {
  final String id;
  final String categoryName;
  final String status;
  final String createdDate;
String product;

  CategoryProductModel(
      {this.id,
      this.categoryName,
      this.status,
      this.createdDate,
      this.product});

fromJson(Map json) {


    return CategoryProductModel(
 
      id: json['id'],
      categoryName: json['categoryName'],
      status: json['status'],
      createdDate: json['createdDate'],
    );
  }
}
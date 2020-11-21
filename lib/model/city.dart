
import 'package:oscar/model/productModel.dart';
class City {
  String cat_id;
  String cat_title;

  //List<ProductModel> product;


  City(
      {this.cat_id,
      this.cat_title,
      
      });

 fromJson(Map data) {
   //var list = json['product'] as List;
   //List<ProductModel> productList = list.map((i)=>ProductModel.fromJson(i)).toList();
  
   return City(
     //product: productList,
    cat_id: data['cat_id'],
    cat_title: data['cat_title'],


   );
    
  }
}
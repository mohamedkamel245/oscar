

import 'package:oscar/repository.dart';

class ProductService{
  Repository _repository;
  ProductService(){
    _repository = Repository();
  }
  getHotProducts(String catId,String job) async {
   return await _repository.getData("products.php", {"cat_id":catId,"job_id":job});
    // print(respons['msg']);
    // return respons['data'];
  }

  

  getProductsByCategoryId() async {
return _repository.httpGetById("productsCat.php");
}
}

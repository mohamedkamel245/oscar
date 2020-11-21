


import 'package:oscar/repository.dart';

class CategoryService{
  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }
  getCategory() async {
    return await _repository.httpGetp('categories.php');
  }
   getCategory1() async {
    return await _repository.httpGetp('s.php');
  }
   getCategory2() async {
    return await _repository.getData('a.php',{});
  }
}
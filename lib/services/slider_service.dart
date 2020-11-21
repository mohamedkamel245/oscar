


import 'package:oscar/repository.dart';


class SliderService{
  Repository _repository;
  SliderService(){
    _repository = Repository();
  }
  getSliders() async {
    return await _repository.httpGetp('sliders.php');
  }
  getSap() async {
    return await _repository.httpGetp('slidesap.php');
  }
  getTou() async {
    return await _repository.httpGetp('slidetou.php');
  }

   getCuts() async {
    return await _repository.httpGetp('cuts.php');
  }
  getCutm() async {
    return await _repository.httpGetp('cutm.php');
  }
}
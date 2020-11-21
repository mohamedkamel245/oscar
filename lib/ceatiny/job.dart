import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/BottomBar/Profileused.dart';
import 'package:oscar/Profileuser.dart';
import 'package:oscar/ceatiny/employeeEidget.dart';
import 'package:oscar/model/city.dart';
import 'package:oscar/model/network.dart';
import 'package:oscar/model/productModel.dart';
import 'package:oscar/repository.dart';
import 'package:oscar/screen.dart';
import 'package:oscar/services/category_service.dart';
import 'package:oscar/services/product_service.dart';

// ignore: must_be_immutable
class Job extends StatefulWidget {

final String job;
final String title;
final String images;
Job(this.job,this.title,this.images);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  
  ProductService _productService = ProductService();
 CategoryService _categoryService = CategoryService();
   Repository _repository;
var loadling = true;
List<ProductModel> _productList = [];

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String selectedValue;
String deviceID;








getDeviceInfo() async{
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print("Device Info :${androidInfo.id}");
  setState(() {
    deviceID = androidInfo.id;
  });
}
  List<String> colorList = [];

List<City> listCategory = [];



// List<SliderModel> list = [];


addFavorite(ProductModel model) async{
 setState(() {
  loadling = true;
});
final response = await http.post(NetworkUrl.addfavoriteS(),body:{
  "deviceInfo" : deviceID,
  "idProduct" : model.id,
});
 final data = json.decode(response.body);
 int value = data['value'];
 String message = data['message'];
 if (value ==1) {
   print(message);
       Fluttertoast.showToast(
        msg: "تم الاضافة الي المفضلة",
        
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
     setState(() {
  loadling = false;
});
 } else {
     print(message);
     setState(() {
  loadling = false;
});
 }
}



 _getAllHotProducts(String catId,String job) async {
   var hotProducts = await _productService.getHotProducts(catId,job);
   var data = json.decode(hotProducts.body);
   List<ProductModel> products = new List<ProductModel>();
   print("employee list: $data");

    for(var city in data){
        ProductModel product = ProductModel();
        products.add(product.fromJson(city));
      }
      print("product List: ${products.length}");
      setState(() {
        _productList.clear();
        _productList.addAll(products);
   });
        // _productList = result.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
 
  
 }




_caid()async{
    // var data =  _categoryService.getCategory2();  
    var data =  await _repository.getData('a.php',{"id":"1"}); 
   
      for(var city in data){
        City a = City();
        listCategory.add(a.fromJson(city));
      }
      loadling = false;
    //setState(() {});
  
}



int index = 0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _caid();
  //  _getAllHotProducts();

   getDeviceInfo();
    
  }




var flutter = false;

  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        widget.title,
          
        ),
        backgroundColor: Color(0xFF818aff),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          
          children: <Widget>[
            
                    Container(
                  
                  height: 400,
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(
                      image:AssetImage(widget.images,),
                      
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                         Colors.blue.withOpacity(.5),
                          Colors.black.withOpacity(.0),
                        ]

                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                                InkWell(
            onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_products(_cartItems)));

            },
                      child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                
                height: 150,
                width: 30,
                 child: Stack(
                   children: <Widget>[
                 
                   ],
                 ),
              ),
              
            ),
        )
                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            
                              Text(widget.title, 
                              style:GoogleFonts.elMessiri(
                      textStyle: TextStyle(color: Colors.black,fontSize: 40, ),
                      )
                              ),
                              // SizedBox(height: 30,),
                              Text("أبحث عن أفضل الفنيين",
                              style: TextStyle(color: Colors.black,),
                              ),
                            ],
                          ),
                        ),

                        ],
                      ),
                    ),


                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: DropdownButton(
                hint: Text("أختر المدينة"),
                value: selectedValue,
                items: listCategory.map((cat){
                  return DropdownMenuItem(
                    value: cat.cat_id,
                    child: Text(cat.cat_title),
                  );
                }
                ).toList(),
                 onChanged: (value){
                   setState(() {
                     selectedValue = value;
                     print("selected city: $value");
                      _productList.clear();
                     // catID = 1
                   });
                   print("city :$value - job : ${widget.job}");
                  _getAllHotProducts(value,widget.job);
                 }),
            ),
           
          _productList != null && _productList.length>0 ?  
          ListView.builder( 
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: _productList.length,
            itemBuilder: (context, i){
              final employee = _productList[i];
              return  EmployeeWidget(employee,widget.title);
            }
            
           ) :Padding(
             padding: const EdgeInsets.only(right: 5,),
             child: Text("أختر مدينة من فضلك",
               style:GoogleFonts.mada(
                                                    textStyle: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20, 
                                                      fontWeight:FontWeight.w500
                                                      ),
                                                    ),
             ),
           )
          ],
        ),
        
      ),
      
    );
  }
}
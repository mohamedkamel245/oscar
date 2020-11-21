import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oscar/Profileuser.dart';
import 'package:oscar/model/network.dart';
import 'package:oscar/model/productModel.dart';
import 'package:oscar/model/sar.dart';
import 'package:oscar/screen.dart';
import 'package:oscar/services/category_service.dart';
import 'package:oscar/services/product_service.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
    CategoryService _productService = CategoryService();
var loadling = false;
DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String selectedValue;
String deviceID;
List<Sar> _productList = [];

List<Sar> _productListSearch = [];

getDeviceInfo() async{
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print("Device Info :${androidInfo.id}");
  setState(() {
    deviceID = androidInfo.id;
  });
}
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
 _getAllHotProducts() async {
   setState(() {
     loadling = true;
   });
   final hotProducts = await _productService.getCategory1();
if (hotProducts.statusCode == 200) {
  final result = json.decode(hotProducts.body);
   print(_productList);
   setState(() {
        _productList = result.map<Sar>((item) => Sar.fromJson(item)).toList();
        loadling = false;
   });
}else{
  setState(() {
    loadling = false;
  });
}
   
   
 }

 TextEditingController searhController = TextEditingController();

 onSearh(String text)async{
   _productListSearch.clear();
   if (text.isEmpty) {
     setState(() {
       
     });
     
   }
    _productList.forEach((a){
      if (a.o_name.toLowerCase().contains(text)) 
        _productListSearch.add(a);
      
    });

    setState(() {
      
    });

 }

Future<void> onRefresh() async{
  _getAllHotProducts();
}

@override
 void initState() {
    // TODO: implement initState
    super.initState();
   _getAllHotProducts();
    getDeviceInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));
          },
                  child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10)
               ),
               margin: EdgeInsets.symmetric(horizontal: 2),
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Column(
                 children: <Widget>[
                   Container(
                     child: Row(
                       children: <Widget>[
                         
                     Expanded(
                      child: TextField(
                        controller: searhController,
                        onChanged: onSearh,
                         decoration: InputDecoration(
                         hintText: "ابحث عن الفني",
                         border: InputBorder.none
                       )
                       ),
                     ),
                     InkWell(
                       onTap: (){
                       },
                       child: Container(
                         child: Icon(Icons.search,color: Colors.black,)
                         )
                         ),
                     

                 
                       ],
                     ),
                   ),
                 ],
               ),
             ),
        ),
      ),
      body: Container(
        child: loadling ? Center(
          child: CircularProgressIndicator(),
        ): searhController.text.isNotEmpty || _productListSearch != 0 ? ListView.builder(
           
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: _productListSearch.length,
          
            itemBuilder: (context, i){
              final a = _productListSearch[i];
              
              return 
         
                
                 Container(
      margin: EdgeInsets.only(left: 3,right: 6),
      child: Stack(
        overflow: Overflow.visible,
        children: [

          Positioned(right: 5,bottom: 5,top: 3,left: 2,
            child: Container(
              padding: EdgeInsets.only(left: fromRealWidth(10, context)),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 8, offset: Offset(0,4)),],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
              ),
              child: InkWell(
                      onTap: () => 
            Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) =>  ProfileUser(
                
               detail_name: a.o_name,
                detail_o_number: a.o_number,
                detail_ctiy: a.ctiy.toString(),
                detail_cat : a.cat.toString(),
                        detail_image: "http://dzs.rcl.mybluehost.me/oscar/image/"+ a.image,
               detail_imagee: "http://dzs.rcl.mybluehost.me/oscar/image2/" + a.imagee,
               detail_imageee: "http://dzs.rcl.mybluehost.me/oscar/image3/" + a.imageee,
               detail_imageeee: "http://dzs.rcl.mybluehost.me/oscar/image4/" + a.imageeee,

              ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Container(
                      margin: EdgeInsets.only(right: 130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(a.o_name, style:GoogleFonts.elMessiri(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15, 
                                                        fontWeight:FontWeight.w500
                                                        ),
                                                      ),),
                           Positioned(
                            top: 2,
                            height: 4,
                            child: IconButton(
                              onPressed: (){
                                
                                
                                  // addFavorite(a);
                                
                              },
                            icon: Icon(Icons.favorite_border,color: Colors.red,)),
                          ),
                        ],
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(right: 150,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Column(
                            children: [
                              Text("تقييم",style: TextStyle(color: Colors.grey,shadows: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                              ]),),
                              Container(height: 2,),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amber,),
                                  Text("3.0",style: TextStyle(color: Colors.black,shadows: [
                                    BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                                  ]),),
                                ],
                              )
                            ],
                          ),


                          // Column(
                          //   children: [
                          //     Text("المدنية",style: TextStyle(color: Colors.grey,shadows: [
                          //       BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                          //     ]),),
                          //     Container(height: 2,),
                          //     Row(
                          //       children: [
                          //         Text("",style: TextStyle(color: Colors.black,shadows: [
                          //           BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                          //         ]),),
                          //       ],
                          //     )
                          //   ],
                          // ),



                          // Column(
                          //   children: [
                          //     Text("فني",style: TextStyle(color: Colors.grey,shadows: [
                          //       BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                          //     ]),),
                          //     Container(height: 2,),
                          //     Row(
                          //       children: [
                          //         Text(,style: TextStyle(color: Colors.black,shadows: [
                          //           BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5),
                                    
                          //         ]
                          //         ,
                          //         fontSize: 12,
                          //         ),
                                  
                          //         ),
                          //       ],
                          //     )
                          //   ],
                          // ),


                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 15, offset: Offset(2,4)),],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
            height: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
            width: isLandSpace(context) ? fromRealWidth(1, context) : fromRealHeight(12, context),
            child: InkWell(
                onTap: (){},
                child: Image.network("http://dzs.rcl.mybluehost.me/oscar/image/" + a.image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
            ),
        ),
      ),
    ),
              ),

        ],
      ),
    );
              
            }
            
           )  : 
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Please Search your item product",
              style: TextStyle(color: Colors.amber),),
            ],
          ),
        ),
      ),
    );
  }
}
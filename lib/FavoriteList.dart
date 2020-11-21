
import 'dart:convert';
import 'package:device_info/device_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/Profileuser.dart';

import 'package:oscar/model/network.dart';
import 'package:oscar/model/productModel.dart';
import 'package:oscar/screen.dart';
import 'package:oscar/services/product_service.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
var loadling = false;
String deviceID;
 List<ProductModel> _productList = [];
  ProductService _productService = ProductService();

getDeviceInfo() async{
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print("Device Info :${androidInfo.id}");
  setState(() {
    deviceID = androidInfo.id;
  });
  _getAllHotProducts();
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
        msg: "تم الحذف من المفضلة",
        
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
   _getAllHotProducts();
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
   var hotProducts = await http.get(NetworkUrl.getfavoriteS(deviceID));
   var data = json.decode(hotProducts.body);
   setState(() {
        _productList..clear();
   });
    for(var city in data){
        ProductModel product = ProductModel();
        _productList.add(product.fromJson(city));
      }
      print("product List: ${_productList.length}");
        // _productList = result.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
 
  
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(),
body: loadling ? Center(
        
child: CircularProgressIndicator(
  
),

   ):  ListView.builder(
           
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: _productList.length,
          
            itemBuilder: (context, i){
              final a = _productList[i];
              
              return 
         
                
                 Container(
      margin: EdgeInsets.only(left: 3,right: 6),
      child: Stack(
        overflow: Overflow.visible,
        children: [

          Positioned(right: 12,bottom: 10,top: 10,left: 10,
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
                          
                        ],
                      ),
                    ),



                    Container(
                      margin: EdgeInsets.only(right: 150,top: 0),
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



                          Column(
                            children: [
                              Text("فني",style: TextStyle(color: Colors.grey,shadows: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                              ]),),
                              Container(height: 2,),
                              Row(
                                children: [
                                  Text("",style: TextStyle(color: Colors.black,shadows: [
                                    BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5),
                                    
                                  ]
                                  ,
                                  fontSize: 12,
                                  ),
                                  
                                  ),
                                ],
                              )
                            ],
                          ),
 Padding(
                           padding: const EdgeInsets.only(bottom: 20), 
                            child: IconButton(
                              onPressed: (){
                                
                                
                                  addFavorite(a);
                                
                              },
                            icon: Icon(Icons.delete,color: Colors.red,size: 50,),),
                          ),

 
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
            
           ),
);

















    // return Container(
    //   child: ListView(
    //     children: [

    //       Container(height: fromRealHeight(5, context),),

    //       Container(
                      
    //         child: Text("قائمة المفضلة",
    //              style:GoogleFonts.elMessiri(
    //                                                   textStyle: TextStyle(
    //                                                     color: Colors.black,
    //                                                     fontSize: 25, 
    //                                                     fontWeight:FontWeight.w500
    //                                                     ),
    //                                                   ),
    //         ),
    //       ),

    //       Container(height: 20,),

    //     Container(
    
    //   child: Stack(
    //     overflow: Overflow.visible,
    //     children: [

    //       Positioned(right: 0,bottom: 1,top: 1,left: 5,
    //         child: Container(
    //           padding: EdgeInsets.only(left: fromRealWidth(3, context)),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 15, offset: Offset(2,4)),],
    //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
    //           ),
    //           child: InkWell(
    //             onTap: (){},
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [

    //                 Container(
    //                   margin: EdgeInsets.only(right: 150),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Text("name",textAlign: TextAlign.left,style: TextStyle(fontSize: fromSize(17,context), color: Colors.black,shadows: [
    //                         BoxShadow(color: Colors.grey,blurRadius: 8)
    //                       ])),
                       
    //                     ],
    //                   ),
    //                 ),

              

    //                 Container(
    //                   margin: EdgeInsets.only(right: 150,top: 10),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [


    //                   Column(
    //                         children: [
    //                           Text("تقييم",style: TextStyle(color: Colors.grey,shadows: [
    //                             BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
    //                           ]),),
    //                           Container(height: 2,),
    //                           Row(
    //                             children: [
    //                               Icon(Icons.star,color: Colors.amber,),
    //                               Text("4.5",style: TextStyle(color: Colors.black,shadows: [
    //                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
    //                               ]),),
    //                             ],
    //                           )
    //                         ],
    //                       ),


   
                       

    //                       Column(
    //                         children: [
    //                           Text("فني",style: TextStyle(color: Colors.grey,shadows: [
    //                             BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
    //                           ]),),
    //                           Container(height: 2,),
    //                           Row(
    //                             children: [
    //                               Text("صناعي",style: TextStyle(color: Colors.black,shadows: [
    //                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5),
                                    
    //                               ]
    //                               ,
    //                               fontSize: 12,
    //                               ),
                                  
    //                               ),
    //                             ],
    //                           )
    //                         ],
    //                       ),

    //                       Padding(
    //                         padding: const EdgeInsets.only(bottom: 20),
    //                         child: Icon(Icons.delete,color: Colors.red,size: 50,),
    //                       ),


    //                     ],
    //                   ),
    //                 )

    //               ],
    //             ),
    //           ),
    //         ),),

    //        Container(
    //   decoration: BoxDecoration(
    //     boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 15, offset: Offset(2,4)),],
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.all(Radius.circular(10)),
    //     child: Container(
    //       height: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
    //       width: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
    //       child: InkWell(
    //         onTap: (){},
    //         child: Image.asset("image",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
    //       ),
    //     ),
    //   ),
    // ),

    //     ],
    //   ),
    // ),


    //     ],
    //   ),
    // );
  }
}






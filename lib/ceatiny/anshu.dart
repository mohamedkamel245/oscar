// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:device_info/device_info.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:oscar/BottomBar/Profileusea.dart';
// import 'package:oscar/Profileuser.dart';
// import 'package:oscar/model/Aa.dart';
// import 'package:oscar/model/productModel.dart';
// import 'package:oscar/screen.dart';

// import 'package:oscar/services/category_service.dart';
// import 'package:oscar/services/product_service.dart';


// class Anshu extends StatefulWidget {
//   @override
//   _AnshuState createState() => _AnshuState();
// }

// class _AnshuState extends State<Anshu> {

//   ProductService _productService = ProductService();
//  CategoryService _categoryService = CategoryService();
// var loadling = false;
// List<ProductModel> _productList = [];

// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

// String deviceID;

// getDeviceInfo() async{
//   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//   print("Device Info :${androidInfo.id}");
//   setState(() {
//     deviceID = androidInfo.id;
//   });
// }
//   List<String> colorList = [];

// List<Aa> listCategory = [];



// // List<SliderModel> list = [];





//  _getAllHotProducts() async {
//    var hotProducts = await _productService.getHotProducts();
//    var result = json.decode(hotProducts.body);
//    setState(() {
//         _productList = result.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
//    });
//    print(_productList.length);
//  }




// _caid()async{
//   setState(() {
//   loadling = true;
// });
//   final categories = await _categoryService.getCategory2();
//   if (categories.statusCode ==200) {
//     final data = jsonDecode(categories.body);
//     print(data);
//     setState(() {
//       for(Map i in data){
//         listCategory.add(Aa.fromJson(i));
//       }
//       loadling = false;
//     });
//   } else {
//     setState(() {
//       loadling = false;
//     });
//   }
// }

// Future<void> onRefresh() async {
//   _caid();
//   setState(() {
//     flutter = false;
//   });
// }

// int index = 0;

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   _caid();
//    _getAllHotProducts();

//    getDeviceInfo();
    
//   }




// var flutter = false;

// //  _getAllHotProducts() async {
// //    var hotProducts = await _productService.getHotProducts();
// //    var result = json.decode(hotProducts.body);
// //    setState(() {
// //         _productList = result.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
// //    });
// //    print(_productList.length);
// //  }
// // @override
// //  void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //    _getAllHotProducts();
// //   }
//   TabController tabController;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//        appBar: AppBar(
//         title: Text(
//           "فني انشائي",
          
//         ),
//         backgroundColor: Color(0xFFfcb75c),
//       ),
 

//       body:  loadling ? Center(
        
// child: CircularProgressIndicator(
  
// ),

//    ): RefreshIndicator(
//      onRefresh: onRefresh,
     
//      child: ListView(
       
//        children: <Widget>[
         
//         //  Container(
//         //    height: 300,
//         //    child: carousel2Slider(list),
//         //  ),
         
//         //  SizedBox(
//         //    height: 1,
//         //  ),
//         // Container(
//         //   alignment: Alignment.center,
//         //   child: Image.asset('images/products/fhd.jpg',
         
//         //   ),
//         // ),
//          Container(
                  
//                   height: 400,
//                   decoration: BoxDecoration(
                    
//                     image: DecorationImage(
//                       image:AssetImage("assets/ffg.jpg",),
                      
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomRight,
//                         colors: [
//                          Colors.blue.withOpacity(.5),
//                           Colors.black.withOpacity(.0),
//                         ]

//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 50.0,),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                                 InkWell(
//             onTap: (){
//         // Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_products(_cartItems)));

//             },
//                       child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Container(
                
//                 height: 150,
//                 width: 30,
//                  child: Stack(
//                    children: <Widget>[
//                       //  IconButton(
//                       //    iconSize: 25,
//                       //    icon: Icon(Icons.shopping_cart, color: Color(0xfff8d008),), onPressed: (){
                           
//                       //    }),
//                         //  Positioned(
//                         //    child: Stack(
//                         //    children: <Widget>[
//                         //      Icon(Icons.brightness_1, size: 20, color: Colors.red),
//                         //      Positioned(
//                         //        top: 1.0,
//                         //        left: 5.0,
//                         //        child: Center(child: Consumer<CartService>(builder: (context , _cart , child) {
//                         //          print("this value of cart ${_cart.cartIteCounts}");
//                         //          return  Text('${_cart.cartIteCounts}');
//                         //        }
//                         //       ),
//                         //        )
//                         //        ),
//                         //    ],
//                         //  ),
//                         //  ),
//                    ],
//                  ),
//               ),
              
//             ),
//         )
//                             ],
//                           ),
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
                            
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
                            
//                               Text('فني انشائي', 
//                               style:GoogleFonts.elMessiri(
//                       textStyle: TextStyle(color: Colors.black,fontSize: 40, ),
//                       )
//                               ),
//                               // SizedBox(height: 30,),
//                               Text("أبحث عن أفضل الفنيين",
//                               style: TextStyle(color: Colors.black,),
//                               ),
//                             ],
//                           ),
//                         ),

//                         ],
//                       ),
//                     ),


//                   ),
//                 ),
    
//          Container(
//            width: 100.0,
//            height: 60.0,
//            color: Colors.white,
           
//            child: ListView.builder(
             
//              shrinkWrap: true,
//              scrollDirection: Axis.horizontal,
             
//              itemCount: listCategory.length,
//              itemBuilder: (context, i){
//               final a = listCategory[i];
//                return InkWell(
//                  onTap: (){
//                    setState(() {
//                      flutter = true;
//                      index = i;
//                      print(flutter);
//                    });
//                  },
//                  child: Card(
                   
//                    margin: EdgeInsets.only(right: 1, left: 5,top: 5,bottom: 10),
//                    color: Color(0xFFfcb75c),
//           child: Padding(
//             padding: const EdgeInsets.all(6),
            
//             child: Column(
              
//               children: <Widget>[
               
               
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(a.cat_title,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w900,color: Colors.black),
//                    textDirection: TextDirection.rtl,
//                     ),
//                     ),
//               ],
//               ),
//           ),

//                  ),
//                );
//              },
//            ),
//          ),
//           //  new Padding(padding: const EdgeInsets.only(left: 5,top: 4,bottom: 5,),
//           // child: Align(
//           //   alignment: Alignment.bottomRight,
//           //   child: Container(
//           //     color: Color(0xfff8d008),
//           //     child: Text('تصنيف المنتجات',
//           // style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.w800),
//           // ),
//           //   ),
//           // ),
//           // ),
         

         
//          if (flutter) ListView.builder(
           
//            shrinkWrap: true,
//            physics: ClampingScrollPhysics(),
//             padding: EdgeInsets.all(10),
//             itemCount: listCategory[index].product.length,
          
//             itemBuilder: (context, i){
//               final a = listCategory[index].product[i];
              
//               return InkWell(
//                   onTap: () => 
//             Navigator.of(context).push(
//             new MaterialPageRoute(
//               builder: (context) =>  ProfileUsera(
                
//                detail_name: a.o_name,
//                 detail_o_number: a.o_number,

//                detail_image: "http://dzs.rcl.mybluehost.me/oscar/image/"+ a.image,
                
         
               
                
                

//               ))),
         
                
//                 child: Container(
//       margin: EdgeInsets.only(left: 3,right: 6),
//       child: Stack(
//         overflow: Overflow.visible,
//         children: [

//           Positioned(right: 5,bottom: 5,top: 3,left: 2,
//             child: Container(
//               padding: EdgeInsets.only(left: fromRealWidth(10, context)),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 8, offset: Offset(0,4)),],
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
//               ),
//               child: InkWell(
//                      onTap: () => 
//             Navigator.of(context).push(
//             new MaterialPageRoute(
//               builder: (context) =>  ProfileUsera(
                
//                detail_name: a.o_name,
//                 detail_o_number: a.o_number,

//                detail_image: "http://dzs.rcl.mybluehost.me/oscar/image/"+ a.image,
                
         
               
                
                

//               ))),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [

//                     Container(
//                       margin: EdgeInsets.only(right: 120),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(a.o_name, style:GoogleFonts.elMessiri(
//                                                       textStyle: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 15, 
//                                                         fontWeight:FontWeight.w500
//                                                         ),
//                                                       ),),
//                           Icon(Icons.favorite,color: Colors.red,),
//                         ],
//                       ),
//                     ),


//                     Container(
//                       margin: EdgeInsets.only(right: 150,top: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [


//                           Column(
//                             children: [
//                               Text("تقييم",style: TextStyle(color: Colors.grey,shadows: [
//                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                               ]),),
//                               Container(height: 2,),
//                               Row(
//                                 children: [
//                                   Icon(Icons.star,color: Colors.amber,),
//                                   Text("4.5",style: TextStyle(color: Colors.black,shadows: [
//                                     BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                                   ]),),
//                                 ],
//                               )
//                             ],
//                           ),


//                           // Column(
//                           //   children: [
//                           //     Text("المدنية",style: TextStyle(color: Colors.grey,shadows: [
//                           //       BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                           //     ]),),
//                           //     Container(height: 2,),
//                           //     Row(
//                           //       children: [
//                           //         Text("",style: TextStyle(color: Colors.black,shadows: [
//                           //           BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                           //         ]),),
//                           //       ],
//                           //     )
//                           //   ],
//                           // ),



//                           Column(
//                             children: [
//                               Text("فني",style: TextStyle(color: Colors.grey,shadows: [
//                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                               ]),),
//                               Container(height: 2,),
//                               Row(
//                                 children: [
//                                   Text("انشائي",style: TextStyle(color: Colors.black,shadows: [
//                                     BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5),
                                    
//                                   ]
//                                   ,
//                                   fontSize: 12,
//                                   ),
                                  
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),


//                         ],
//                       ),
//                     )

//                   ],
//                 ),
//               ),
//             ),),


//               InkWell(
//                       onTap: () => 
//             Navigator.of(context).push(
//             new MaterialPageRoute(
//               builder: (context) =>  ProfileUser(
                
//                detail_name: a.o_name,
//                 detail_o_number: a.o_number,

//                detail_image: "http://dzs.rcl.mybluehost.me/oscar/image/"+ a.image,

//               ))),
//                               child: Container(
//                                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//       decoration: BoxDecoration(
//         boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 15, offset: Offset(2,4)),],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//         child: Container(
//             height: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
//             width: isLandSpace(context) ? fromRealWidth(1, context) : fromRealHeight(12, context),
//             child: InkWell(
//                   onTap: (){},
//                   child: Image.network("http://dzs.rcl.mybluehost.me/oscar/image/" + a.image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
//             ),
//         ),
//       ),
//     ),
//                 ),
//                               ),
//               ),

//         ],
//       ),
//     ),
//               );
//             }
            
//            ) else  Padding(
//              padding: const EdgeInsets.only(right: 5,),
//              child: Text("أختر مدينة من فضلك",
//                style:GoogleFonts.mada(
//                                                     textStyle: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 20, 
//                                                       fontWeight:FontWeight.w500
//                                                       ),
//                                                     ),
//              ),
//            )
//        ]
//      )
     
//      ),
      
//     );
//   }
// }
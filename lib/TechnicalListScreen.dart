
// import 'dart:convert';

// import 'package:device_info/device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:oscar/model/categoryProductModel.dart';

// import 'package:oscar/model/productModel.dart';
// import 'package:oscar/screen.dart';
// import 'package:oscar/services/category_service.dart';
// import 'package:oscar/services/product_service.dart';



// class TechnicalListScreen extends StatefulWidget {
//   @override
//   _TechnicalListScreenState createState() => _TechnicalListScreenState();
// }

// class _TechnicalListScreenState extends State<TechnicalListScreen> with TickerProviderStateMixin{
//  ProductService _productService = ProductService();
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

// List<CategoryProductModel> listCategory = [];



// // List<SliderModel> list = [];





//  _getAllHotProducts() async {
//    var hotProducts = await _productService.getHotProducts();
//    var result = json.decode(hotProducts.body);
//    setState(() {
//         _productList = result.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
//    });
//   //  print(_productList.length);
//  }




// _caid()async{
//   setState(() {
//   loadling = true;
// });
//   final categories = await _categoryService.getCategory();
//   if (categories.statusCode ==200) {
//     final data = jsonDecode(categories.body);
//     print(data);
//     setState(() {
//       for(Map i in data){
//         listCategory.add(CategoryProductModel.fromJson(i));
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

//   TabController tabController;
//   @override
//   Widget build(BuildContext context) {

//     if(tabController == null){
//       tabController = new TabController(vsync: this, length: 6);
//     }

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 150.0,
//             backgroundColor: Colors.amber,
//             iconTheme: IconThemeData(color: Colors.white),
//             leading: IconButton(
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//               icon: Icon(Icons.keyboard_backspace,color: Colors.black,size: fromSize(50,context),),
//             ),
//             // actions: [
//             //   IconButton(
//             //     onPressed: (){
//             //     },
//             //     icon: Icon(Icons.filter,color: Colors.deepOrange,size: fromSize(50,context),),
//             //   ),
//             // ],

//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               collapseMode: CollapseMode.pin,
//               centerTitle: true,
//               titlePadding: EdgeInsets.only(bottom: 40),
//               title: Hero(
//                   tag: "OSCAR",
//                   child: Material(
//                     child: Container(
//                       child: Text("Technical List",textAlign: TextAlign.left,style: TextStyle(fontSize: fromSize(45,context), color: Colors.black,shadows: [
//                         BoxShadow(color: Colors.grey,blurRadius: 8)
//                       ])),
//                     ),
//                   )
//               ),
//               background: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                       margin: EdgeInsets.only(top: 16.0),
//                       padding: EdgeInsets.only(left: 32.0, right: 32.0),
//                       child: Text(
//                         'Some text',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'PlayfairDisplay',
//                             fontStyle: FontStyle.italic,
//                             fontSize: 16.0),
//                       )),
//                   Container(
//                       margin: EdgeInsets.only(top: 16.0),
//                       padding: EdgeInsets.only(left: 32.0, right: 32.0),
//                       child: Text(
//                         'some text',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'PlayfairDisplay',
//                             fontSize: 16.0),
//                       )),
//                 ],
//               ),
//             ),
//             bottom: TabBar(
              
//               controller: tabController,
//               indicatorColor: Colors.black,
//               isScrollable: true,
//               labelStyle: TextStyle(fontSize: fromSize(40,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                 BoxShadow(color: Colors.grey,blurRadius: 3)
//               ],),
//               unselectedLabelStyle: TextStyle(fontSize: fromSize(40,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                 BoxShadow(color: Colors.grey,blurRadius: 3)
//               ],),

//               tabs: [
//                 Text("جدة", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//                 Text("مكة المكرمة", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//                 Text("المدينة المنورة", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//                 Text("الرياض", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//                 Text("حائل", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//                 Text("الاحساء", style: TextStyle(fontSize: fromSize(30,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
//                   BoxShadow(color: Colors.grey,blurRadius: 3)
//                 ],),),

//               ],
//             ),
//           ),

//           new SliverList(delegate: new SliverChildListDelegate(
//             [
//               Container(height: fromRealHeight(3, context),),

// Container(
//       margin: EdgeInsets.only(left: 30,right: 3),
//       child: Stack(
//         overflow: Overflow.visible,
//         children: [

//           Positioned(right: 25,bottom: 10,top: -10,left: 4,
//             child: Container(
//               padding: EdgeInsets.only(left: fromRealWidth(10, context)),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 8, offset: Offset(0,4)),],
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
//               ),
//               child: InkWell(
//                 onTap: (){},
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [

//                     Container(
//                       margin: EdgeInsets.only(right: 150),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("LLL",textAlign: TextAlign.left,style: TextStyle(fontSize: fromSize(25,context), color: Colors.black,shadows: [
//                             BoxShadow(color: Colors.grey,blurRadius: 8)
//                           ])),
//                           Icon(Icons.favorite,color: Colors.red,),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       child: Text("l",textAlign: TextAlign.left,style: TextStyle(fontSize: fromSize(15,context), color: Colors.grey,shadows: [
//                         BoxShadow(color: Colors.grey,blurRadius: 8)
//                       ])),
//                     ),

//                     Container(
//                       margin: EdgeInsets.only(right: 130,top: 10),
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


//                           Column(
//                             children: [
//                               Text("وظائف",style: TextStyle(color: Colors.grey,shadows: [
//                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                               ]),),
//                               Container(height: 2,),
//                               Row(
//                                 children: [
//                                   Text("15",style: TextStyle(color: Colors.black,shadows: [
//                                     BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                                   ]),),
//                                 ],
//                               )
//                             ],
//                           ),



//                           Column(
//                             children: [
//                               Text("معدل",style: TextStyle(color: Colors.grey,shadows: [
//                                 BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                               ]),),
//                               Container(height: 2,),
//                               Row(
//                                 children: [
//                                   Text(r"$/n",style: TextStyle(color: Colors.black,shadows: [
//                                     BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
//                                   ]),),
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


//               Container(
//       decoration: BoxDecoration(
//         boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 15, offset: Offset(2,4)),],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(4)),
//         child: Container(
//             height: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
//             width: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
//             child: InkWell(
//               onTap: (){},
//               child: Image.asset("assets/u1.jpg",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
//             ),
//         ),
//       ),
//     ),

//         ],
//       ),
//     ),

          

          
//             ]
//           ))
//         ],
//       ),
//     );

//   }
// }









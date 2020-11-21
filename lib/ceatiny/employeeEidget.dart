import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/Profileuser.dart';
import 'package:oscar/model/productModel.dart';
import 'package:oscar/screen.dart';

class EmployeeWidget extends StatelessWidget {
  
ProductModel employee;
String title;
EmployeeWidget(this.employee,this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                
               detail_name: employee.o_name,
                detail_o_number: employee.o_number,
                detail_ctiy: employee.ctiy,
                detail_cat : title,
                        detail_image: "http://dzs.rcl.mybluehost.me/oscar/image/"+ employee.image,
               detail_imagee: "http://dzs.rcl.mybluehost.me/oscar/image2/" + employee.imagee,
               detail_imageee: "http://dzs.rcl.mybluehost.me/oscar/image3/" + employee.imageee,
               detail_imageeee: "http://dzs.rcl.mybluehost.me/oscar/image4/" + employee.imageeee,

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
                          Text(employee.o_name, style:GoogleFonts.elMessiri(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15, 
                                                        fontWeight:FontWeight.w500
                                                        ),
                                                      ),),
                           Positioned(
                          
                            child: IconButton(
                              onPressed: (){
                                
                                
                                  // addFavorite(employee);
                                
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


                          Column(
                            children: [
                              Text("المدنية",style: TextStyle(color: Colors.grey,shadows: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                              ]),),
                              Container(height: 2,),
                              Row(
                                children: [
                                  Text(employee.ctiy,style: TextStyle(color: Colors.black,shadows: [
                                    BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                                  ]),),
                                ],
                              )
                            ],
                          ),



                          Column(
                            children: [
                              Text("فني",style: TextStyle(color: Colors.grey,shadows: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 5)
                              ]),),
                              Container(height: 2,),
                              Row(
                                children: [
                                  Text(title,style: TextStyle(color: Colors.black,shadows: [
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
                child: Image.network("http://dzs.rcl.mybluehost.me/oscar/image/" + employee.image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
            ),
        ),
      ),
    ),
              ),

        ],
      ),
    );
              
  }
}
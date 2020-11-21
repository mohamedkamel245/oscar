

import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oscar/ProfileTechnical.dart';
import 'package:oscar/RegisterTechnical.dart';
import 'package:oscar/chooseCate.dart';
import 'package:oscar/chooseCate2.dart';

import 'package:oscar/model/categoryProductModel.dart';
import 'package:oscar/model/city.dart';
import 'package:oscar/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileEditTechnical extends StatefulWidget {
  final VoidCallback signOut;
  ProfileEditTechnical(this.signOut);

  @override
  _ProfileEditTechnicalState createState() => _ProfileEditTechnicalState();
}

class _ProfileEditTechnicalState extends State<ProfileEditTechnical> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    signOut(){
    setState(() {
      widget.signOut();
    });
  }

  CategoryProductModel model;
  City model2;
  SignUpState _signUpState = SignUpState.notSignIn;
String o_name, o_number, o_idnumber, o_pass, desilt;
String mgtmd = 'غير معتمد';
final _key = new GlobalKey<FormState>();
TextEditingController  cate = TextEditingController();
TextEditingController  cate2 = TextEditingController();
File o_perspicturer;
File image1;
File image2;
File image3;
File image4;






 Future gallery1() async {
    var _image1 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image1 = _image1;
    });
  }
  Future gallery2() async {
    var _image2 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image2 = _image2;
    });
  }

 gallery3() async {
    var _image3 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image3 = _image3;
    });
  }

 gallery4() async {
    var _image4 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image4 = _image4;
    });
  }

 bool _secureText = true;

  showHide(){
    setState((){
      _secureText = !_secureText;
    }

    );
  }

  check(){
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

//    List<String> o_specialization=<String>[
//     'انشائي',
//     'ديكوري',
//     'صناعي'
//   ];

// List<String> o_city=<String>[
//     'مكة المكرمة','جدة','الرياض','المدينة المنورة','الدمام','الطائف','تبوك','الخرج','بريدة','خميس مشيط','حفر الباطن','حائل','نجران','الجبيل','أبها','ينبع','الخبر','جازان','الاحساء','بريدة','القطيف','أبو عريش','عرعر','وادي الدواسر','بحرة','الدرعية','حوطة بني تميم',
    
//   ];

  
  var _titletype;
  var _titlecity;

pilihCategory() async{

  model = await Navigator.push(context, MaterialPageRoute(
    builder: (context) => ChooseCate()

  ));

  setState(() {
    cate = TextEditingController(text: model.categoryName);
  });
}

pilihCategoryCtiy() async{
  model2 = await Navigator.push(context, MaterialPageRoute(
    builder: (context) => ChooseCate2()

  ));

  setState(() {
    cate2 = TextEditingController(text: model2.cat_title);
  });
}




 Future save()async{
showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("معالجة"),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 4,
                  ),
                  Text("جار التحميل...")
                ],
              ),
            ),
          );
        });
 try {


      var url = Uri.parse("http://dzs.rcl.mybluehost.me/oscar/api/register.php");
      var request = http.MultipartRequest("POST", url);
      
    var pic = await http.MultipartFile.fromPath("image", image1.path);
    var pic1 = await http.MultipartFile.fromPath("imagee", image2.path);
    var pic2 = await http.MultipartFile.fromPath("imageee", image3.path);
    var pic3 = await http.MultipartFile.fromPath("imageeee", image4.path);
    request.files.add(pic);
    request.files.add(pic1);
    request.files.add(pic2);
    request.files.add(pic3);
    
  
      request.fields['idCategory'] = model.id;
       request.fields['cat_id'] = model2.cat_id;
      request.fields['o_name'] = o_name;
      request.fields['o_number'] = o_number;

      request.fields['o_pass'] = o_pass;
      request.fields['mgtmd'] = mgtmd;


      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        final data = jsonDecode(value);
                int valueGet = data['value'];
                String message = data['message'];
                if (valueGet == 1) {
                        Fluttertoast.showToast(
                msg: "تم التسجيل  بنجاح",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 0,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileTechnical(signOut)));
                } else {
                  Navigator.pop(context);
                     Fluttertoast.showToast(
                msg: "ادخل باقي البيانات",
                
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
                }
              });
        
              // if (response.statusCode > 2) {
              //   Navigator.pop(context);
              // }
            } catch (e) {
              debugPrint("Error $e");
            }
           
        
           
          }
          savePref(int value)async{
            SharedPreferences preferences = await SharedPreferences.getInstance();
            setState(() {
              preferences.setInt("value", value);
              // preferences.setInt("customer_id", userid);
              // preferences.setInt("customer_name", name);
              // preferences.setInt("customer_email", email);
              preferences.commit();
            });
          }
        
         _showSnackMessage(message){
            var snackBar = SnackBar(
              content: message,
            );
            
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
          
        
           
          dynamic  o_nnumber, image,image5,image6,image7;
        
          getPref() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        setState(() {
          o_name = preferences.getString("o_name");
          desilt = preferences.getString("desilt");
          mgtmd = preferences.getString("mgtmd");
    
          o_nnumber = preferences.getString("o_nnumber");
          image = preferences.getString("image");
          image5 = preferences.getString("imagee");
          image6 = preferences.getString("imageee");
          image7 = preferences.getString("imageeee");
        
        });
          }
        
          void launchURL() async {
            final url = Uri(
              scheme: 'tel',
              path: o_nnumber,
            );
            if(await canLaunch(url.toString())){
              await launch(url.toString(),);
        
            }else{
              throw 'Can\'t launch ${url.toString()}';
            }
          }
          @override
          void initState() {
            // TODO: implement initState
            super.initState();
              getPref();
          }
         @override
          Widget build(BuildContext context) {
              return Scaffold(
              key: _scaffoldKey,
              body: Stack(
                 children: [
                  ListView(
                children: <Widget>[
                    Container(
                          height: fromRealHeight(10, context),
                        ),
                            Hero(
                            tag: "RegisterUser",
                            child: Material(
                              child: Text("تعديل الملف الشخصي",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: fromSize(50, context),
                                      color: Colors.blue,
                                      shadows: [
                                        BoxShadow(color: Colors.grey, blurRadius: 5)
                                      ])),
                            )),
                            
                        Container(
                          height: fromRealHeight(3, context),
                        ),
                 
                  
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Center(
                        
                        child: Form(
                          key: _key,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                   Container(
                                height: fromRealHeight(2, context),
                              ),
                              
                          InkWell(
                        onTap: gallery1,
                         child: image1 == null ? CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image/'+ image.toString() 
                        ), radius: fromSize(50, context),)
                            : Image.file(
                                image1,
                                fit: BoxFit.cover,
                                height: 100,
                              )
                              ),
                                SizedBox(
                      height: 16,
                    ),
                     
                                SizedBox(
                      height: 16,
                    ),
                    
                        //          InkWell(
                        // onTap: gallery2,
                        //  child: image2 == null ? Icon(
                        //         Icons.camera_alt,
                        //         size: fromSize(80, context),
                        //       )
                        //     : Image.file(
                        //         image2,
                        //         fit: BoxFit.cover,
                        //       )),
        
        
                           Container(
                                 padding: EdgeInsets.only(right: 10,left: 10,top: 3,bottom: 3),
                                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(1,8)
                    )
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.2))
              ),
                                  alignment: Alignment.center,
              margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                                      
                                      child: TextFormField(
                                       onSaved: (e) => o_name = e,
                                       textDirection: TextDirection.rtl,
                                          style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: fromSize(25,context),
                ),
                                        decoration: InputDecoration(
                                          hintText: o_name,
                                          border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                                          icon: Icon(Icons.person_outline, color: Colors.blue,),
                                        ),
                                        validator: (e) {
                                            if (e.isEmpty) {
                                              return "لا يمكن أن يكون حقل الاسم فارغًا";
                                            }
                                          },
                                      ),
                                    ),
                               
                                
                    SizedBox(
                      height: 16,
                    ),
                          
                                  Container(
                                   
                                    padding: EdgeInsets.only(right: 10,left: 10,top: 3,bottom: 3),
                                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(1,8)
                    )
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.2))
              ),
                                  alignment: Alignment.center,
              margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                                   
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          onSaved: (e) => o_number = e,
                                          decoration: InputDecoration(
                                              hintText: o_nnumber,
                                              icon: Icon(Icons.phone, color: Colors.blue,),
                                              border: InputBorder.none),
                                          validator: (e) {
                                            if (e.isEmpty) {
                                              return 'يرجى التأكد    ';
                                            }
                                          },
                                        ),
                                      ),
        
                                                   
                    SizedBox(
                      height: 16,
                    ),
                          
              //                     Container(
                                   
              //                       padding: EdgeInsets.only(right: 10,left: 10,top: 3,bottom: 3),
              //                    decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //     boxShadow: [
              //       BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           blurRadius: 10,
              //           offset: Offset(1,8)
              //       )
              //     ],
              //     border: Border.all(color: Colors.grey.withOpacity(0.2))
              // ),
              //                     alignment: Alignment.center,
              // margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                                   
              //                           child: TextFormField(
              //                             keyboardType: TextInputType.number,
              //                             onSaved: (e) => o_idnumber = e,
              //                             decoration: InputDecoration(
              //                                 hintText: o_idnumber,
              //                                 icon: Icon(Icons.person_pin, color: Colors.blue,),
              //                                 border: InputBorder.none),
              //                             validator: (e) {
              //                               if (e.isEmpty) {
              //                                 return 'يرجى التأكد    ';
              //                               }
              //                             },
              //                           ),
              //                         ),
                                    
                                     SizedBox(
                      height: 16,
                    ),
                    
                        InkWell(
                          onTap: (){
                            pilihCategory();
                          },
                          
                          child: Container(
                       
                                    padding: EdgeInsets.only(right: 10,left: 10,),
                                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(1,8)
                    )
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.2))
              ),
                                  alignment: Alignment.center,
              margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                            child: TextField(
                              enabled: false,
                              controller: cate,
                              keyboardType: TextInputType.text,
                                 decoration: InputDecoration(
                                   
                                          hintText: "أختر التخصص",
                                          border: InputBorder.none,
           
                                          icon: Icon(Icons.ac_unit, color: Colors.blue,)
                                          
                                          
                                        ),
                            ),
                          ),
                        ),
                         
                                     SizedBox(
                      height: 16,
                    ),
                    
                        InkWell(
                          onTap: (){
                            pilihCategoryCtiy();
                          },
                          
                          child: Container(
                       
                                    padding: EdgeInsets.only(right: 10,left: 10,),
                                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(1,8)
                    )
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.2))
              ),
                                  alignment: Alignment.center,
              margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                            child: TextField(
                              enabled: false,
                              controller: cate2,
                              keyboardType: TextInputType.text,
                                 decoration: InputDecoration(
                                   
                                          hintText: "أختر المدينة",
                                          border: InputBorder.none,
           
                                          icon: Icon(Icons.ac_unit, color: Colors.blue,)
                                          
                                          
                                        ),
                            ),
                          ),
                        ),
                      SizedBox(
                      height: 16,
                    ),
                        
              //              Container(
              //                    padding: EdgeInsets.only(right: 10,left: 10,top: 3,bottom: 3),
              //                    decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //     boxShadow: [
              //       BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           blurRadius: 10,
              //           offset: Offset(1,8)
              //       )
              //     ],
              //     border: Border.all(color: Colors.grey.withOpacity(0.2))
              // ),
              //                     alignment: Alignment.center,
              // margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                                      
              //                         child: TextFormField(
              //                          onSaved: (e) => desilt = e,
              //                          textDirection: TextDirection.rtl,
              //                             style: TextStyle(
              //     fontFamily: "Poppins",
              //     color: Colors.black,
              //     fontSize: fromSize(25,context),
              //   ),
              //                           decoration: InputDecoration(
              //                             hintText: desilt,
              //                             border: InputBorder.none,
              //     focusedBorder: InputBorder.none,
              //     enabledBorder: InputBorder.none,
              //     errorBorder: InputBorder.none,
              //     disabledBorder: InputBorder.none,
              //                             icon: Icon(Icons.person_outline, color: Colors.blue,),
              //                           ),
              //                           validator: (e) {
              //                               if (e.isEmpty) {
              //                                 return "لا يمكن أن يكون حقل  فارغًا";
              //                               }
              //                             },
              //                         ),
              //                       ),
        
                       
          Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text("أعمالي",
                        style:GoogleFonts.cairo(
                              textStyle: TextStyle(color: Colors.black,fontSize: 15, ),
                              )
                      ),
                    ),
                       Container(
                       height: 90.0,
                       child: Padding(
                         padding: const EdgeInsets.all(10),
                         child: ListView(
                           scrollDirection: Axis.horizontal,
                           children: <Widget>[
                               Row(
                           children: <Widget>[
                 
               
              Container(
              width: 100.0,
              height: 100.0,
              child:  InkWell(
                        onTap: gallery2,
                         child: image2 == null ? CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image2/'+ image5.toString() 
                        ), radius: fromSize(50, context),)
                            : Image.file(
                                image2,
                                fit: BoxFit.cover,
                                height: 100,
                              )),
            ),
        
        
              Container(
              width: 100.0,
              height: 100.0,
              child:  InkWell(
                        onTap: gallery3,
                        child: image3 == null ? CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image3/'+ image6.toString() 
                        ), radius: fromSize(50, context),)
                            : Image.file(
                                image3,
                               height: 100,
                              )
                              ),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child:  InkWell(
                        onTap: gallery4,
                        child: image4 == null ? CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image4/'+ image7.toString() 
                        ), radius: fromSize(50, context),)
                            : Image.file(
                                image4,
                            height: 100,
                              )
                              ),
            ),
            
                           ],
                         ),
                           ],
                         ),
                       ),
                     ),
                                 
                                  Container(
                                    padding: EdgeInsets.only(right: 10,left: 10,top: 3,bottom: 3),
                                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(1,8)
                    )
                  ],
                  border: Border.all(color: Colors.grey.withOpacity(0.2))
              ),
                                  alignment: Alignment.center,
              margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: ListTile(
                                          title: TextFormField(
                                            keyboardType: TextInputType.number,
                                            obscureText: _secureText,
                                            onSaved: (e) => o_pass = e,
                                            decoration: InputDecoration(
                                                hintText: "كلمة المرور",
                                                icon: Icon(Icons.lock_outline,color: Colors.green,),
                                                border: InputBorder.none),
                                            validator: (e) {
                                              if (e.isEmpty) {
                                                return "لا يمكن أن يكون حقل كلمة المرور فارغًا";
                                              } else if (e.length < 6) {
                                                return "يجب أن تتكون كلمة المرور من 6 أحرف على الأقل";
                                              }
                                              return null;
                                            },
                                          ),
                                          
                                        ),
                                      )
                                  ),
        
                                     Container(
                          height: fromRealHeight(5, context),
                        ),
        
                      Container(
                height: 60,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    right: fromRealWidth(10, context),
                    left: fromRealWidth(10, context)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        new BoxShadow(
                            color: Color(0xFF008fff),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 2.0)),
                      ]),
                  height: fromRealHeight(9, context),
                  child: RaisedButton(
                    onPressed: () {
                       check();
                    },
                    color: Color(0xFF008fff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "تاكيد التعديل",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Mada",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                          fontSize: fromSize(25, context),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                                   
                         
                                
                               
                        Container(
                          height: fromRealHeight(3, context),
                        ),
        
                     
        
                        Container(
                          height: fromRealHeight(1, context),
                        ),
        
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                right: fromRealWidth(10, context),
                                left: fromRealWidth(10, context)),
                            child: Text(
                              "العودة إلى  ",
                              style: TextStyle(
                                fontSize: fromSize(25, context),
                                color: Color(0xFF008fff),
                                fontFamily: "Poppins",
                                shadows: [
                                  BoxShadow(color: Color(0xFF008fff), blurRadius: 3)
                                ],
                              ),
                            ),
                          ),
                        ),
        
                        
                                  
                                ],
                              ),
                            )
                            ),
                      ),
                    ),
                  ),
                  
                ],
              ),
              
              ]
              ),
            );
          }
        
          jsonDecode(value) {}
}




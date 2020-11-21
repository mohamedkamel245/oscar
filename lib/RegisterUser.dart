

import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oscar/LoginUser.dart';
import 'package:oscar/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}
enum SignUpppState{
  notSignIn,
  signIn
}
class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SignUpppState _signUpState = SignUpppState.notSignIn;
String  os_name, os_number,  os_passs;
final _key = new GlobalKey<FormState>();

File image7;
 Future gallery1() async {
    var _image1 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image7 = _image1;
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
                  Text("جاري التسجيل ...")
                ],
              ),
            ),
          );
        });
 try {


      var url = Uri.parse("http://dzs.rcl.mybluehost.me/oscar/api/register2.php");
      var request = http.MultipartRequest("POST", url);
      
    var pic = await http.MultipartFile.fromPath("image", image7.path);

    request.files.add(pic);
    
  
      request.fields['os_name'] = os_name;
       request.fields['os_number'] = os_number;
      request.fields['os_passs'] = os_passs;
  

      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        final data = jsonDecode(value);
        int valueGet = data['value'];
        String message = data['message'];
        if (valueGet == 0) {
                Fluttertoast.showToast(
        msg: "تم التسجيل  بنجاح",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
      Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>LoginUser()), (Route<dynamic> route) => false);
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
                      child: Text("تسجيل المستخدم",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: fromSize(50, context),
                              color: Colors.blue,
                              shadows: [
                                BoxShadow(color: Colors.grey, blurRadius: 8)
                              ])),
                    )),
                    
                Container(
                  height: fromRealHeight(3, context),
                ),
            
          // Container(
          //     alignment: Alignment.topCenter,
          //     child: Image.asset(
          //       'images/cats/Untitled-trr.png',
          //       width: 280.0,
          //       height: 240.0,
          //     )),
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
                 child: image7 == null ? Icon(
                        Icons.camera_alt,
                        size: fromSize(80, context),
                      )
                    : Image.file(
                        image7,
                        fit: BoxFit.cover,
                        height: 100,
                      )),
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
                               onSaved: (e) => os_name = e,
                               textDirection: TextDirection.rtl,
                                  style: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: fromSize(25,context),
        ),
                                decoration: InputDecoration(
                                  labelText: "الأسم",
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
                                  onSaved: (e) => os_number = e,
                                  decoration: InputDecoration(
                                      hintText: "رقم الهاتف",
                                      icon: Icon(Icons.phone, color: Colors.blue,),
                                      border: InputBorder.none),
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return 'يرجى التأكد من صحة   ';
                                    }
                                  },
                                ),
                              ),

                            
                             SizedBox(
              height: 16,
            ),

               
            // Padding(
            //   padding: const EdgeInsets.only(right: 180),
            //   child: Text("أعمالي",
            //     style:GoogleFonts.cairo(
            //             textStyle: TextStyle(color: Colors.black,fontSize: 15, ),
            //             )
            //   ),
            // ),
           
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          //   child: Material(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     color: Colors.blue.withOpacity(0.4),
                          //     elevation: 0.0,
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(left: 12.0),
                          //       child: TextFormField(
                          //         onSaved: (e) => o_mybusiness = e,
                          //         decoration: InputDecoration(
                          //             hintText: "أعمالي",
                          //             icon: Icon(Icons.card_membership, color: Colors.green,),
                          //             border: InputBorder.none),
                          //         validator: (e) {
                          //           if (e.isEmpty) {
                          //             return 'يرجى التأكد من صحة عنوان بريدك الإلكتروني';
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                         
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
                                    onSaved: (e) => os_passs = e,
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
                "التسجيل",
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      right: fromRealWidth(10, context),
                      left: fromRealWidth(10, context)),
                  child: Text(
                    "لديك حساب بالفعل؟",
                    style: TextStyle(
                      fontSize: fromSize(25, context),
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      shadows: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                    ),
                  ),
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
                      "العودة إلى تسجيل الدخول",
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
}





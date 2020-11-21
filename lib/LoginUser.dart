

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oscar/BottomBar/Bottombar.dart';
import 'package:oscar/Home.dart';

import 'package:oscar/RegisterUser.dart';
import 'package:oscar/RestPassword.dart';
import 'package:oscar/screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}
enum LoginStatus{
  notSignI,
  signI
}
class _LoginUserState extends State<LoginUser> {

 LoginStatus _loginStatus = LoginStatus.notSignI;
  String os_number, os_passs;
  final _key = GlobalKey<FormState>();

  bool _secureText = true;

  showHide(){
    setState((){
      _secureText = !_secureText;
    }

    );
  }

signOu() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignI;
    });
  }

  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }
  login() async{
    final response = await http.post("http://dzs.rcl.mybluehost.me/oscar/api/login2.php",
     body: {
      "os_number" : os_number,
      "os_passs" : os_passs
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String customer = data['os_id'];
    String os_name = data['os_name'];
    dynamic oss_number = data['os_number'];
    dynamic image = data['image'];
    


    if (value==1) {
      
            Fluttertoast.showToast(
        msg: "تم تسجيل الدخول بنجاح",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  
            
      setState(() {

        _loginStatus = LoginStatus.signI;
        savePref(value, customer,os_name,oss_number,image);
     
      });

      print(pesan);
    } else {
         Fluttertoast.showToast(
        msg: "رقم الهاتف او كلمة السر خطا",
        
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
   
    
  }

  savePref(int value,dynamic customer, String os_name,dynamic oss_number,dynamic image)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("os_id", customer);
      preferences.setString("image", image);
      preferences.setString("os_name", os_name);
      preferences.setString("os_number", oss_number);
     
    });
  }

  var value;
  var o_id;
  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
     

      _loginStatus = value == 1 ? LoginStatus.signI : LoginStatus.notSignI;
    });
  }

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    login();
    
  }

   @override
  Widget build(BuildContext context) {
       switch (_loginStatus) {
    case LoginStatus.notSignI:
   return Scaffold(
      body: Stack(
        children: [

                    SingleChildScrollView(
                child:Container(
                  height: isLandSpace(context) ? fromRealWidth(100, context) : fromRealHeight(100, context),
          child:  Column(
        children: <Widget>[
      
                      Container(
                        margin: EdgeInsets.only(right: 70,top: fromRealHeight(8, context)),
                        alignment: Alignment.center,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [

                            Hero(
                              tag: "1",
                              child: Transform.rotate(
                                angle: 2.3,
                                child: Container(width:fromSize(100,context), height:fromSize(100,context),decoration: BoxDecoration(
                                  color: Color(0xFF00bfdb),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(color: Color(0xFF00bfdb),blurRadius: 3)
                                  ],
                                ),),
                              ),
                            ),

                            Positioned(
                                left: 35,
                                child: Hero(
                                  tag:"3",
                                  child: Transform.rotate(
                                    angle: 2.3,
                                    child: Container(width:fromSize(100,context), height:fromSize(100,context),decoration: BoxDecoration(
                                      color: Color(0xFF0090ff),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(color: Color(0xFF0090ff),blurRadius: 3)
                                      ],
                                    ),),
                                  ),
                                )
                            ),



                            Positioned(
                                left: 70,
                                child: Hero(
                                  tag:"2",
                                  child: Transform.rotate(
                                    angle: 2.3,
                                    child: Container(width:fromSize(100,context), height:fromSize(100,context),decoration: BoxDecoration(
                                      color: Color(0xFF00217e),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(color: Color(0xFF00217e),blurRadius: 3)
                                      ],
                                    ),),
                                  ),
                                )
                            ),


                          ],
                        ),
                      ),
                        Container(height: fromRealHeight(5, context),),

                      Text("OSCAR",textAlign: TextAlign.center,style: TextStyle(fontSize: fromSize(80,context), color: Colors.black,shadows: [
                        BoxShadow(color: Colors.grey,blurRadius: 8)
                      ])),

       
          Expanded(
            child: Container(
             
              child: Center(
                child: Form(
                  key: _key,
                    child: Column(
                       mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
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
                               textDirection: TextDirection.rtl,
                                  style: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: fromSize(25,context),
        ),
                                decoration: InputDecoration(
                                  labelText: "رقم الهاتف",
                                  border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
                                  icon: Icon(Icons.phone, color: Colors.blue,),
                                ),
                                validator: (e) {
                                  if (e.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(e))
                                      return 'يرجى كتابة رقم الهاتف';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          Container(height: 20,),
                        

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
                                obscureText: _secureText,
                                onSaved: (e) => os_passs = e,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  labelText: "كلمة السر",
                                     border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
                                  suffixIcon: IconButton(icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility), 
                                  
                                  onPressed: showHide,),
                                  icon: Icon(Icons.lock_outline, color: Colors.blue),
                                ),
                                
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
                          InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (c)=> RestPassword()));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context),top: 10),
                                    child: Text("نسيت كلمة السر؟", style: TextStyle(fontSize: fromSize(25,context), color: Color(0xFF008fff),fontFamily: "Poppins",shadows: [
                                      BoxShadow(color: Color(0xFF008fff),blurRadius: 3)
                                    ],),),
                                  ),
                                ),
                        

                       Container(height: 20,),
                        Container(
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: fromRealWidth(10,context), left: fromRealWidth(10,context)),
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
          height: fromRealHeight(9,context),
          child: RaisedButton(
            onPressed: () {
              check();
              // Navigator.push(context, FadeRouteBuilder(page:ProfileTechnical()));
            },
            color: Color(0xFF008fff),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(
              child: Text(
                "تسجيل الدخول",
                maxLines: 1,
                style: TextStyle(
                  fontFamily: "Mada",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(color: Colors.grey,blurRadius: 5)
                  ],
                  fontSize: fromSize(25,context),),
              ),
            ),
          ),
        ),
      ),
                  Container(height: fromRealHeight(3, context),),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                        child: Text("ليس لديك حساب؟", style: TextStyle(fontSize: fromSize(25,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
                          BoxShadow(color: Colors.grey,blurRadius: 3)
                        ],),),
                      ),

                      Container(height: fromRealHeight(1, context),),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> RegisterUser()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                          child: Text("أفتح حساب الأن", style: TextStyle(fontSize: fromSize(25,context), color: Color(0xFF008fff),fontFamily: "Poppins",shadows: [
                            BoxShadow(color: Color(0xFF008fff),blurRadius: 3)
                          ],),),
                        ),
                      ),
//                          Expanded(child: Container()),

                  
                      ],
                    )
                    ),
              ),
            ),
          ),
         
        ],
      )
      )
   )
    ]
      ),
     
    );
       break;
      case LoginStatus.signI:
        return ProviderBottomBar(signOu);
        
      break;
    }
  }
}

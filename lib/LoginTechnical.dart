


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:oscar/ProfileTechnical.dart';
import 'package:oscar/RegisterTechnical.dart';
import 'package:oscar/RestPassword.dart';
import 'package:oscar/screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginTechnical extends StatefulWidget {
  @override
  _LoginTechnicalState createState() => _LoginTechnicalState();
}


enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginTechnicalState extends State<LoginTechnical> {

  LoginStatus _loginStatus = LoginStatus.notSignIn;
 String o_number, o_pass;
  final _key = GlobalKey<FormState>();

  bool _secureText = true;

  showHide(){
    setState((){
      _secureText = !_secureText;
    }

    );
  }

  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }
  login() async{
    final response = await http.post("http://dzs.rcl.mybluehost.me/oscar/api/login.php",
     body: {
     "o_number" : o_number,
      "o_pass" : o_pass
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String customer = data['o_id'];
    String o_name = data['o_name'];
    dynamic o_nnumber = data['o_number'];
    dynamic image1 = data['image'];
    dynamic image2 = data['imagee'];
    dynamic image3 = data['imageee'];
    dynamic image4 = data['imageeee'];
    dynamic o_idnumber = data['o_idnumber'];
    String mgtmd = data['mgtmd'];
    String desilt = data['desilt'];

 
    


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
        _loginStatus = LoginStatus.signIn;
        savePref(value, customer,o_name,o_nnumber,image1,image2,image3,image4,o_idnumber,mgtmd,desilt);
      }
      );

      print(pesan);
      print(customer);
      print(o_name);
      print(o_idnumber);
  print(image1);

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

  savePref(int value,dynamic customer,String o_name,dynamic o_nnumber,dynamic image1,dynamic image2,dynamic image3,dynamic image4,dynamic o_idnumber,String mgtmd,String desilt,)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("o_id", customer);
      preferences.setString("o_name", o_name);
      preferences.setString("o_nnumber", o_nnumber);
      preferences.setString("image", image1);
      preferences.setString("imagee", image2);
      preferences.setString("imageee", image3);
      preferences.setString("imageeee", image4);
      preferences.setString("o_idnumber", o_idnumber);
      preferences.setString("mgtmd", mgtmd);
      preferences.setString("desilt", desilt);
     
    });
  }

  var value;
  var customer_id;
  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
     

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();

  }

   @override
  Widget build(BuildContext context) {
       switch (_loginStatus) {
    case LoginStatus.notSignIn:
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
                               onSaved: (e) => o_number = e,
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
                                      return 'يرجى التأكد من صحة عنوان بريدك الإلكتروني';
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
                                onSaved: (e) => o_pass = e,
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
              // Navigator.push(context, FadeRouteBuilder(page:ProfileTechnical(name: "my name",image: "assets/my_image2.jpg",)));
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
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> RegisterTechnical()));
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
      case LoginStatus.signIn:
        return ProfileTechnical(signOut);
        
      break;
    }
  }
}







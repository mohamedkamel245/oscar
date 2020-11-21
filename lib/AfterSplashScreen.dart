

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oscar/LoginTechnical.dart';
import 'package:oscar/LoginUser.dart';
import 'package:oscar/screen.dart';


class AfterSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          children: [


            SingleChildScrollView(
                child:Container(
                  height: fromRealHeight(100, context),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                      Container(
                        margin: EdgeInsets.only(right: 70,top: fromRealHeight(8, context)),
                        alignment: Alignment.center,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [

                            Positioned(
                              left: -90,
                              bottom: 80,
                              child: Hero(
                                tag:"3",
                                child: Transform.rotate(
                                  angle: 2.9,
                                  child: Container(width:fromSize(250,context), height:fromSize(250,context),decoration: BoxDecoration(
                                    color: Color(0xFF0090ff),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(color: Color(0xFF0090ff),blurRadius: 3)
                                    ],
                                  ),),
                                ),
                              )
                            ),



                            Hero(
                              tag: "1",
                              child:   Transform.rotate(
                                angle: 2.3,
                                child: Container(width:fromSize(300,context), height:fromSize(300,context),decoration: BoxDecoration(
                                  color: Color(0xFF00bfdb),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(color: Color(0xFF00bfdb),blurRadius: 3)
                                  ],
                                ),),
                              ),

                            ),




                            Positioned(
                              left: 200,
                              child:  Hero(
                                tag: "2",
                                child:   Transform.rotate(
                                  angle: 2.3,
                                  child: Container(width:fromSize(250,context), height:fromSize(250,context),decoration: BoxDecoration(
                                    color: Color(0xFF00217e),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(color: Color(0xFF00217e),blurRadius: 3)
                                    ],
                                  ),),
                                ),

                              ),
                            ),


                          ],
                        ),
                      ),


                      Container(height: fromRealHeight(5, context),),

                      Hero(
                        tag: "OSCAR",
                        child: Material(
                          child: Text("OSCAR",textAlign: TextAlign.center,style: TextStyle(fontSize: fromSize(80,context), color: Colors.black,shadows: [
                            BoxShadow(color: Colors.grey,blurRadius: 8)
                          ])),
                        )
                      ),



                      Container(height: fromRealHeight(3, context),),

                      Button(onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginTechnical()));
                      },
                      text: "فني صناعي", tag: "technicalLoginBtn",),

                      Container(
                        height: fromRealHeight(3, context),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                        child: Text("او", style: TextStyle(fontSize: fromSize(25,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
                          BoxShadow(color: Colors.grey,blurRadius: 3)
                        ],),),
                      ),

                      Button(onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginUser()));
                      },
                      tag: "userLoginBtn", text: "مستخدم",),

                      Container(height: fromRealHeight(3, context),),

                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                      //   child: Text("ليس لديك حساب؟", style: TextStyle(fontSize: fromSize(25,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
                      //     BoxShadow(color: Colors.grey,blurRadius: 3)
                      //   ],),),
                      // ),

                      Container(height: fromRealHeight(1, context),),

                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                      //   child: Text("أفتح حساب الأن", style: TextStyle(fontSize: fromSize(25,context), color: Color(0xFF008fff),fontFamily: "Poppins",shadows: [
                      //     BoxShadow(color: Color(0xFF008fff),blurRadius: 3)
                      //   ],),),
                      // ),

                      Container(height: fromRealHeight(7, context),),


                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.only(right: fromRealWidth(10, context), left: fromRealWidth(10, context)),
                      //   child: Text("الأحكام والشروط", style: TextStyle(fontSize: fromSize(25,context), color: Colors.grey,fontFamily: "Poppins",shadows: [
                      //     BoxShadow(color: Colors.grey,blurRadius: 3)
                      //   ],),),
                      // ),

                      Container(height: fromRealHeight(5, context),),


                    ],
                  ),
                )
            ),

          ],
        )
    );
  }
}


class Button extends StatelessWidget {
  final Function onPress;
  final String text;
  final String tag;
  const Button({Key key, this.onPress, this.text, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
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
            onPressed: () {onPress();},
            color: Color(0xFF008fff),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(
              child: Text(
                text,
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
    );
  }
}

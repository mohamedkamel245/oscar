

import 'package:flutter/material.dart';
import 'package:oscar/screen.dart';


class RestPassword extends StatefulWidget {
  @override
  _RestPasswordState createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [

            Container(height: fromRealHeight(5, context),),

            Container(
              margin: EdgeInsets.only(left: 180),
              child: Text("اعادة تعين كلمة السر",textAlign: TextAlign.left,style: TextStyle(fontSize: fromSize(70,context), color: Colors.black,shadows: [
                BoxShadow(color: Colors.blue,blurRadius: 8)
              ])),
            ),

            Container(height: 50,),

            EditText(
              hint: "رقم الهاتف",
              icon: Icon(Icons.phone,color: Colors.grey,),
            ),

            Container(height: 30,),

            ButtonRestPassword(),

          ],
        ),
      ),
    );
  }
}


class EditText extends StatelessWidget {
  final String hint;
  final Widget icon;
  const EditText({Key key, this.hint, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        style: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: fromSize(25,context),
        ),
        textAlign: TextAlign.left,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            color: Colors.grey.withOpacity(0.5),
            fontSize: fromSize(25,context),
          ),
          icon: icon,
          labelText: hint,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}


class ButtonRestPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: () {},
          color: Color(0xFF008fff),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(
              "ادخل رقم الهاتف",
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
    );
  }
}


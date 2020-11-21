

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/screen.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [

          Container(height: fromRealHeight(5, context),),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(height: 20,),
              Container(
                margin: EdgeInsets.only(right: 250),
                child: Text("شركة مصنع اوسكار",maxLines: null,textAlign: TextAlign.left,style: TextStyle(fontFamily: "Mada2",fontSize: fromSize(30,context), color: Colors.grey,shadows: [
                  BoxShadow(color: Colors.grey,blurRadius: 5)
                ])),
              ),
              Container(height: 10,),
              Container(
                margin: EdgeInsets.all(5),
                child: Text("كان لا بد ان نكمل النجاح والتحول الى الصناعة بما نملكه من ارضية الهبرة المكتسبة من خلال السنوات الثمانية عشر الجادة اوجدت لنا الهدف سعيا للوصول الي القمة من خلال خطط مدروسة تم وضعها لهذه الغاية",maxLines: null,textAlign: TextAlign.left,style: TextStyle(fontFamily: "Mada2",fontSize: fromSize(30,context), color: Colors.red,shadows: [
                  BoxShadow(color: Colors.grey,blurRadius: 5)
                ])),
              ),
            ],
          ),

        ],
      ),
    );
  }
}



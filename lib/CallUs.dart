

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUs extends StatelessWidget {

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
        children: [

          Container(height: fromRealHeight(5, context),),

          Container(
            
            child: Padding(
              padding: const EdgeInsets.only(left: 270),
              child: Text("اتصل بنا",
              textAlign: TextAlign.left,
               style:GoogleFonts.mada(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20, 
                                                        fontWeight:FontWeight.w500
                                                        ),
                                                      ),),
            ),
          ),
          Container(height: 20,),
          Container(
                        padding: const EdgeInsets.only(left: 250),

            child: Text("لا تتردد في الاتصال بنا",maxLines: null,textAlign: TextAlign.left,style: TextStyle(fontFamily: "Mada2",fontSize: fromSize(30,context), color: Colors.grey,shadows: [
              BoxShadow(color: Colors.grey,blurRadius: 5)
            ])),
          ),
          Container(height: 20,),
          Container(
              padding: const EdgeInsets.only(left: 120),
            child: Text("اذا كان لديك اي اسئلة فلا تتردد في الاتصال بنا . عمل خدمة العملاء لدينا 27/7",maxLines: null,textAlign: TextAlign.left,style: TextStyle(fontFamily: "Mada2",fontSize: fromSize(30,context), color: Colors.red,shadows: [
              BoxShadow(color: Colors.grey,blurRadius: 5)
            ])),
          ),
          Container(height: 20,),
          ItemCallUs(
            icon: Icon(Icons.location_on,color: Theme.of(context).primaryColor),
            title: "العنوان",
            subtitle: "المملكة العربية السعودية - جدة - الخمره",
          ),
          Container(height: 20,),
          Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(2,4)
            )
          ]
      ),
      margin: EdgeInsets.only(top: 10,right: 3,left: 20),
      child: ListTile(
        onTap: (){},
        leading: Icon(Icons.phone,color: Theme.of(context).primaryColor,),
        title: Text("واتساب"),
        subtitle: Text("0555098044",maxLines: null,),
        trailing:   RaisedButton(
          color: Colors.green,
                  onPressed: () {
                    customLaunch('https://api.whatsapp.com/send?phone=00966555098044');
                  },
                  child: Text('تواصل'),
                ),
      ),
    ),
         
          Container(height: 20,),
  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(2,4)
            )
          ]
      ),
      margin: EdgeInsets.only(top: 10,right: 3,left: 20),
      child: ListTile(
        onTap: (){},
        leading: Icon(Icons.phone,color: Theme.of(context).primaryColor,),
        title: Text("الايميل"),
        subtitle: Text("info@oscarpaints.com",maxLines: null,),
        trailing:   RaisedButton(
          color: Colors.red[400],
                  onPressed: () {
                    customLaunch('mailto:info@oscarpaints.com');
                  },
                  child: Text('ارسل'),
                ),
      ),
    ),


        ],
      ),
   );

  }
}


class ItemCallUs extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  const ItemCallUs({Key key, this.title, this.subtitle, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(2,4)
            )
          ]
      ),
      margin: EdgeInsets.only(top: 10,right: 3,left: 20),
      child: ListTile(
        onTap: (){},
        leading: icon,
        title: Text(title),
        subtitle: Text(subtitle,maxLines: null,),
        
      ),
    );
  }
}

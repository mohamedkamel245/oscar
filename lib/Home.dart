

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oscar/CustomShapeClipper.dart';
import 'package:oscar/ceatiny/Hour_s.dart';
import 'package:oscar/TechnicalListScreen.dart';
import 'package:oscar/ceatiny/anshu.dart';
import 'package:oscar/ceatiny/dako.dart';
import 'package:oscar/ceatiny/job.dart';
import 'package:oscar/model/sliderModel.dart';
import 'package:oscar/screen.dart';
import 'package:oscar/search_s.dart';
import 'package:oscar/slider_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
      final VoidCallback signOu;
  Home(this.signOu);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   signOu(){
    setState(() {
      widget.signOu();
    });
  }

   List<SliderModel> list = [ 
 SliderModel(slide_id:"1" ,slide_image: "https://www.propertyfinder.eg/blog/wp-content/uploads/2019/05/NONAGON-style-n9s-blue-walls-accent-home-decor-design-trends-2017-color-series-west-elm-decorate-blue-paint-sofa-art-decoratives-leather-chair-bronze-table-wood-plant-vase-table-lamp-1-800x626.jpg"),
   SliderModel(slide_id:"2" ,slide_image: "https://www.gheir.com/big/1-red-decor-23-27-10-2017.jpg"),
   SliderModel(slide_id:"3" ,slide_image: "https://women-girls.org/wp-content/uploads/2016/10/20161022-22.jpg"),
   SliderModel(slide_id:"4" ,slide_image: "https://www.almrsal.com/wp-content/uploads/2018/11/%D8%AF%D9%87%D8%A7%D9%86-%D8%AD%D8%A7%D8%A6%D8%B7-%D9%88%D8%B1%D8%AF%D9%8A.jpg"),
   SliderModel(slide_id:"5" ,slide_image: "https://yawmiyati.com/assets/media/%D8%B9%D8%A7%D9%84%D9%85%D9%8A/%D8%AF%D9%8A%D9%83%D9%88%D8%B1/%D8%A7%D9%84%D9%88%D8%A7%D9%86_%D8%AF%D9%87%D8%A7%D9%86%D8%A7%D8%AA_%D8%B5%D8%A7%D9%84%D8%A7%D8%AA_%D8%B1%D9%88%D8%B9%D9%87_2019.jpg"),
   SliderModel(slide_id:"6" ,slide_image: "https://3asry.com/wp-content/uploads/2013/12/co10-550x288.jpg"),
  
 ];

   String os_name = "";
  dynamic customer, oss_number, image;

  getPref() async {
SharedPreferences preferences = await SharedPreferences.getInstance();
setState(() {
  customer = preferences.getString("os_id");
  os_name = preferences.getString("os_name");
  image = preferences.getString("image");
  oss_number = preferences.getString("os_number");

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
    return Stack(
      children: <Widget>[
        
           ClipPath(
          clipper: CustomShapeClipper(),
          child:Container(
            height: 270.0,
            
                  decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                  
         Color(0xFF0090ff),
                  Colors.white
              
              ]
              ),
            ),
            ),
        ),
   
        Container(
          
            child: ListView(
              
              children: [

                Container(height: fromRealHeight(5, context),),

                Container(
                  margin: EdgeInsets.only(right: fromRealWidth(4,context),left: fromRealWidth(4,context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                      Container(
                       child:   CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image7/'+ image.toString() 
                        ), radius: fromSize(50, context),),
                     
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Text("$os_name",
                        style:GoogleFonts.mada(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15, 
                                                      fontWeight:FontWeight.w500
                                                      ),
                                                    ),),
                      ),
                           Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){
                  signOu();
                },
                icon:Icon(Icons.lock_open, color: Colors.amber,) , 
                ),
              ),


                    ],
                  ),
                ),




                InkWell(
                  onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));

                  },
                              child: EditTextSearch(
                    hint: "أبحث",
                    icon: Icon(Icons.search,color: Colors.deepOrange,),
                  ),
                ),

                Container(height: fromRealHeight(3, context),),

                Container(
                  margin: EdgeInsets.only(right: fromRealWidth(5,context),left: fromRealWidth(5,context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("الفئات",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Mada2",fontSize: fromSize(36,context), color: Colors.black,shadows: [
                          BoxShadow(color: Colors.grey,blurRadius: 8)
                        ])),
                      ),

                    ],
                  ),
                ),

                Container(height: fromRealHeight(0.5, context),),

                Container(
                  height: isLandSpace(context) ? fromRealWidth(18, context) : fromRealHeight(18, context),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    children: [
                      Container(width: fromRealWidth(3, context),),

                      ItemTasks(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>Job("1","فني انشائي","assets/ffg.jpg")));
                        },
                       image: Image.asset("assets/ghgh.png",filterQuality: FilterQuality.high,fit: BoxFit.cover,height: 30,),
                        color: Color(0xFFfcb75c),
                        title: "فني",
                        subTitle: "انشائي",
                      ),

                      Container(width: fromRealWidth(3, context),),
                      ItemTasks(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>Job("2","فني صناعي","assets/fgf.jpg")));
                        },
                       image: Image.asset("assets/hhh5.png",filterQuality: FilterQuality.high,fit: BoxFit.cover,height: 30,),
                        color: Color(0xFFfc5e5f),
                        title: "فني",
                        subTitle: "صناعي",
                      ),
                      Container(width: fromRealWidth(3, context),),
                      ItemTasks(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>Job("3","فني ديكور","assets/ggg.jpg")));
                        },
                       image: Image.asset("assets/ghgh.png",fit: BoxFit.cover,height: 30,),
                        color: Color(0xFF818aff),
                        title: "فني",
                        subTitle: "ديكوري",
                      ),


                    ],
                  ),
                ),

                Container(height: fromRealHeight(2, context),),
carouselSlider(list),
                

              ],
            )
        ),
      ],
    );
  }
}


class ItemTasks extends StatelessWidget {

  final Color color;
  final Widget image;
  final String title;
  final String subTitle;
  final Function onTap;
  const ItemTasks({Key key, this.color, this.image, this.title, this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
        width: isLandSpace(context) ? fromRealWidth(15, context) : fromRealHeight(15, context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 15, offset: Offset(2,4)),],
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image,
                Text(title,style: TextStyle(color: Colors.white,fontSize: fromSize(20,context)),),
                Text(subTitle,style: TextStyle(fontFamily: "Mada2",color: Colors.white,fontSize: fromSize(50,context)),),
              ],
            ),
          ),
        )
    );
  }
}


class ItemCategory extends StatelessWidget {

  final Color color;
  final Widget image;
  final String title;
  final String subTitle;
  const ItemCategory({Key key, this.color, this.image, this.title, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 15, offset: Offset(2,4)),],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
            height: isLandSpace(context) ? fromRealWidth(28, context) : fromRealHeight(28, context),
            width: isLandSpace(context) ? fromRealWidth(30, context) : fromRealHeight(30, context),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: image,
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style:GoogleFonts.elMessiri(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25, 
                                                        fontWeight:FontWeight.w500
                                                        ),
                                                      ),),
                        Text(subTitle,style: TextStyle(fontFamily: "Mada2",color: Colors.grey,fontSize: fromSize(28,context)),),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}



class EditTextSearch extends StatelessWidget {
  final String hint;
  final Widget icon;
  const EditTextSearch({Key key, this.hint, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));

              },
          child: Container(
        padding: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
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
        margin: EdgeInsets.only(right: fromRealWidth(4,context), left: fromRealWidth(4,context)),
        child:  Column(children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(padding: const EdgeInsets.all(4.0),
                          child: Text("ابحث عن الفني"),
                          
                          ),
                          ),
                          Container(
                                                   child: Icon(Icons.search)
                           )
                        ],
                      ),
                    ),
                  ],),
      ),
    );
  }
}
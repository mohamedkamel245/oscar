
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oscar/FadeRouteBuilder.dart';
import 'package:oscar/ProfileEditTechnical.dart';
import 'package:oscar/rating_bar.dart';
import 'package:oscar/screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';




class ProfileUserd extends StatefulWidget {
  final detail_name;
  final detail_o_number;
  final detail_image;




ProfileUserd({
this.detail_name,
this.detail_o_number,
this.detail_image,


});

  @override
  _ProfileUserdState createState() => _ProfileUserdState();
}

class _ProfileUserdState extends State<ProfileUserd> {

    void launchURL() async {
    final url = Uri(
      scheme: 'tel',
      path: widget.detail_o_number,
    );
    if(await canLaunch(url.toString())){
      await launch(url.toString(),);

    }else{
      throw 'Can\'t launch ${url.toString()}';
    }
  }

  Future getpost() async {
  var url = "http://dzs.rcl.mybluehost.me/oscar/api/post.php" ;
  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
    return responsebody;
  }
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getpost();
      
    }
  
    List<String> posts = [];
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
  
        body: Stack(
          children: [
  
            Positioned.fill(
                child: ListView(
                  children: [
  
                    Container(
                      margin: EdgeInsets.only(right: fromRealWidth(7,context),left: fromRealWidth(7,context),top: fromRealHeight(7,context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
  
                          CircleAvatar(backgroundColor: Colors.white, backgroundImage: NetworkImage(
                            
                          widget.detail_image
                          ), radius: fromRealWidth(10,context),),
  
                        
  
  
                        ],
                      ),
                    ),
  
  
                    Container(
                      margin: EdgeInsets.only(right: fromRealWidth(7,context),left: fromRealWidth(7,context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(widget.detail_name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromSize(40,context)),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text("معتمد من اوسكار",style: TextStyle(shadows: [BoxShadow(color: Colors.black,blurRadius: 5)],color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromSize(25,context),fontFamily: "Poppins",),),
                                  Container(width: 5,),
                                  Icon(Icons.verified_user,color: Colors.blueAccent,),
                                ],
                              ),
                            ],
                          ),
  
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFff0052),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: 
                            
                            
                            InkWell(
                               onTap: 
                          () => launchURL(),
                                                        child: Container(
                                padding: EdgeInsets.only(top: fromRealHeight(4,context),bottom: fromRealHeight(4,context),right: fromRealWidth(2,context),left: fromRealWidth(2,context)),
                                alignment: Alignment.center,
                                child: Icon(Icons.call,color: Colors.white,size: isLandSpace(context) ? fromRealWidth(4,context) : fromRealWidth(6,context),),
                              ),
                            ),
                          )
  
                        ],
                      ),
                    ),
  
  
  
                    Container(
                      margin: EdgeInsets.only(right: fromRealWidth(7,context),left: fromRealWidth(5,context)),
                      child: RatingBar(
                        alignment: Alignment.centerLeft,
                        onRatingChanged: (rating){
                          showRatingDialog(context,rating);
                        },
                        initialRating: 5,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Colors.orange,
                        emptyColor: Colors.yellow,
                        halfFilledColor: Colors.amberAccent,
                        size: fromSize(50,context),
                      ),
                    ),
  
                    // ButtonShowRating(),
  
                    Container(height: fromRealHeight(5, context),),
  
                    Container(
          margin: EdgeInsets.only(right: 10, left: 20, top: 10),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: <Widget>[
          
                   Container(
        decoration: BoxDecoration(boxShadow: [
          new BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20.0,
              spreadRadius: 0.0,
              offset: Offset(5.0, 0.0)),
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF818aff).withOpacity(0.4),
                       Color(0xFF818aff).withOpacity(0.4)
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.5, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              padding: EdgeInsets.all(10),
              child:Text(
                "فني ديكوري",
                style: TextStyle(
                    fontFamily: "SquadaOne", fontSize: 17, color: Colors.white),
              )
            )),
      ),
            
            ],
          )),
  
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
  
  
                          Container(
                            margin: EdgeInsets.only(right: fromRealWidth(7,context),left: fromRealWidth(7,context),top: fromRealHeight(3,context)),
                            child:Text("اعمالي",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromRealWidth(5,context),fontFamily: "Poppins"),),
                          ),
  
                          Container(height: fromRealHeight(2,context),),
  
                          Container(
                            height: isLandSpace(context) ? fromRealHeight(50,context) : fromRealHeight(35,context),
                            width:  fromRealWidth(100,context),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(top: 0,bottom: 20),
                              children: [
                                Container(width: fromRealWidth(7, context),),
  
                                ItemCategory(
                                  image: Image.network(widget.detail_image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                  
                                ),
  
                                Container(width: fromRealWidth(3, context),),
                                ItemCategory(
                                  image: Image.network(widget.detail_image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                 
                                ),
  
                                Container(width: fromRealWidth(3, context),),
                                ItemCategory(
                                  image: Image.network(widget.detail_image,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                  
                                ),
                                Container(width: fromRealWidth(3, context),),
  
                              ],
                            ),
                          ),
  
                        ],
                      ),
                    ),
  
  
                    Container(
                      margin: EdgeInsets.only(right: fromRealWidth(7,context),left: fromRealWidth(7,context),top: fromRealHeight(3,context)),
                      child:Text("الاراء",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromRealWidth(5,context),fontFamily: "Poppins"),),
                    ),
  
  
   Container(
     width: 0.0, height: 0.0,
     child: FutureBuilder(
      
        future: getpost(),
      
        builder:(BuildContext context, AsyncSnapshot snapshot){
      
      if (snapshot.hasData) {
      
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
      
            margin: EdgeInsets.only(top: 10,right: 10,left: 30),
      
            child: Column(
      
              children: <Widget>[
      
                for (int i = 0; i < snapshot.data.length; i++)
      
                ListTile(
      
                  leading: CircleAvatar(backgroundColor: Colors.white, backgroundImage: ExactAssetImage("assets/my_image2.jpg"), radius: fromRealWidth(10,context),),
      
                  title: Text(snapshot.data[i]['post_uesr'].toString(),),
      
                  subtitle: Text(snapshot.data[i]['post'],),
      
                ),
      
              ],
      
            ),
      
          );
      
      } 
      
        }
      
      ),
   ),

                
  
                  ],
                )
            ),
          ],
        ),
      );
    }
  
    jsonDecode(body) {}
}




// Opinions
class CommentItem extends StatelessWidget {
  final String name;
  final String comment;
  const CommentItem({Key key, this.comment, this.name}) : super(key: key);
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
      margin: EdgeInsets.only(top: 10,right: 10,left: 30),
      child: ListTile(
        onTap: (){},
        leading: CircleAvatar(backgroundColor: Colors.white, backgroundImage: ExactAssetImage("assets/my_image2.jpg"), radius: fromRealWidth(10,context),),
        title: Text("jjjj"),
        subtitle: Text(comment,maxLines: null,),
      ),
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

      
                ],
              ),
            )
        ),
      ),
    );
  }
}

void showRatingDialog(BuildContext context, double rating){
  showDialog(context: context,
      builder: (builder){
        return RatingBarPop(rating: rating,);
      }
  );
}

class RatingBarPop extends StatefulWidget {
    final double rating;
  const RatingBarPop({Key key, this.rating}) : super(key: key);
  @override
  _RatingBarPopState createState() => _RatingBarPopState();
}

class _RatingBarPopState extends State<RatingBarPop> {
  TextEditingController _addpost = new TextEditingController() ;

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

  Future apppost() async {
    var url = "http://dzs.rcl.mybluehost.me/oscar/api/apppost.php" ;
    var data = {"post" : _addpost.text, "post_uesr" : customer} ;
    var res = await http.post(url , body: data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apppost();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
            height: fromRealHeight(50, context),
            margin:EdgeInsets.only(right: 20,left: 20,top: 100,bottom: 100),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      RatingBar(
                        alignment: Alignment.center,
                        onRatingChanged: (rating){

                        },
                        
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Colors.orange,
                        emptyColor: Colors.yellow,
                        halfFilledColor: Colors.amberAccent,
                        size: 40,
                      ),

                      Container(height: 30,),

                      TextField(
                        controller: _addpost,
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
        icon: Icon(Icons.comment,color: Colors.grey,),
        labelText: "تعليق",
        fillColor: Colors.grey,
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.all( Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.all( Radius.circular(10))
        ),
      ),
    ),

                      Container(height: 30,),

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
          onPressed: () {},
          color: Color(0xFF008fff),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: InkWell(
            onTap: (){
              apppost();
Navigator.pop(context);
                                   Fluttertoast.showToast(
        msg: "تم التقييم والتعليق ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
            },
                      child: Center(
              child: Text(
                "ارسل",
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
    ),

                    ],
                  ),
                )
            )
        ),
      )
    );
  }
}


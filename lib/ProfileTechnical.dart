
import 'package:flutter/material.dart';
import 'package:oscar/FadeRouteBuilder.dart';
import 'package:oscar/ProfileEditTechnical.dart';
import 'package:oscar/rating_bar.dart';
import 'package:oscar/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';




class ProfileTechnical extends StatefulWidget {
  final VoidCallback signOut;
  ProfileTechnical(this.signOut);
  @override
  _ProfileTechnicalState createState() => _ProfileTechnicalState();
}

class _ProfileTechnicalState extends State<ProfileTechnical> {

    signOut(){
    setState(() {
      widget.signOut();
    });
  }

   String o_name = "";
  dynamic customer, image1, image2, image3, image4,o_idnumber ,o_nnumber;

  gePref() async {
SharedPreferences preferences = await SharedPreferences.getInstance();
setState(() {
  customer = preferences.getString("o_id");
  o_name = preferences.getString("o_name");
  o_nnumber = preferences.getString("o_nnumber");
  image1 = preferences.getString("image");
  image2 = preferences.getString("imagee");
  image3 = preferences.getString("imageee");
  image4 = preferences.getString("imageeee");
  o_idnumber = preferences.getString("o_idnumber");
print(image2);
print(image3);
print(image4);
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
      gePref();
  }
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
                          
                          'http://dzs.rcl.mybluehost.me/oscar/image/' + image1
                        ), radius: fromRealWidth(10,context),),

                        IconButton(
                          onPressed: (){
                             Navigator.push(context, FadeRouteBuilder(page: ProfileEditTechnical(signOut)));
                          },
                          icon: Icon(Icons.edit,color: Colors.black,size: isLandSpace(context) ? fromRealWidth(6,context) : fromRealWidth(8,context),),
                        ),


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
                            Text("$o_name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromSize(40,context)),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                               Text("معتمد من اوسكار",style: TextStyle(shadows: [BoxShadow(color: Colors.blue,blurRadius: 15)],color: Colors.black,fontWeight: FontWeight.bold,fontSize: fromSize(40,context)),),
                                Container(width: 5,),
                                Icon(Icons.verified_user,color: Colors.blueAccent,size: 40,),
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
            ItemTags(
              text: "جدة",
            ),
            ItemTags(
              text: "فني صناعي",
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
                               image: Image.network('http://dzs.rcl.mybluehost.me/oscar/image2/'+ image2,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                
                              ),

                              Container(width: fromRealWidth(3, context),),
                              ItemCategory(
                                image: Image.network('http://dzs.rcl.mybluehost.me/oscar/image3/'+ image3,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                               
                              ),

                              Container(width: fromRealWidth(3, context),),
                              ItemCategory(
                                image: Image.network('http://dzs.rcl.mybluehost.me/oscar/image4/'+ image4,filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                                
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


                  CommentItem(
                    name: "زبون",
                    comment: "التعامل معك كان جيد",
                  ),

              

                  Container(height: fromRealHeight(30,context),),
                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              signOut();
            },
            icon:Icon(Icons.lock_open, color: Colors.amber,) , 
            ),
          ),

                ],
              )
          ),
        ],
      ),
    );
  }
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
        title: Text(name),
        subtitle: Text(comment,maxLines: null,),
      ),
    );
  }
}







class ItemTags extends StatelessWidget {
  final String text;
  final Color color;
  const ItemTags({Key key, this.text, this.color = Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Colors.blue.withOpacity(0.6),
                      Colors.blue.withOpacity(0.6)
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
            padding: EdgeInsets.all(10),
            child:Text(
              text,
              style: TextStyle(
                  fontFamily: "SquadaOne", fontSize: 17, color: Colors.white),
            )
          )),
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


class RatingBarPop extends StatelessWidget {
  final double rating;
  const RatingBarPop({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
            height: fromRealHeight(50, context),
            margin:EdgeInsets.only(right: 20,left: 20,top: 100,bottom: 100),
            padding: EdgeInsets.all(20),
    
            child: Center(
       
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      RatingBar(
                        alignment: Alignment.center,
                        onRatingChanged: (rating){

                        },
                        initialRating: rating,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Colors.orange,
                        emptyColor: Colors.yellow,
                        halfFilledColor: Colors.amberAccent,
                        size: 40,
                      ),

               
                    ],
                  ),
                
            )
        ),
      )
    );
  }
}




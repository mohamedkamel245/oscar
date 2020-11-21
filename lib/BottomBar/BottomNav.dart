



import 'package:flutter/material.dart';
import 'package:oscar/screen.dart';


class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  final bool selected;
  BottomNavigation({Key key, this.currentIndex, this.onTap, this.selected = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: onTap, // new
      currentIndex: currentIndex, //
      items: [

        BottomNavigationBarItem(
          activeIcon: IconButton(
            icon: Icon(Icons.info,color: Theme.of(context).primaryColor,),
            onPressed: null,
          ),
          icon: IconButton(
            icon: Icon(Icons.info,color: Colors.grey,),
            onPressed: null,
          ),
          title: Text(
            "حول",
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,fontSize: fromSize(25,context)),
          ),
        ),

        BottomNavigationBarItem(
          activeIcon: IconButton(
            icon: Icon(Icons.home,color: Theme.of(context).primaryColor,),
            onPressed: null,
          ),
          icon: IconButton(
            icon: Icon(Icons.home,color: Colors.grey,),
            onPressed: null,
          ),
          title: Text(
            "الرئيسية",
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,fontSize: fromSize(25,context)),
          ),
        ),

        BottomNavigationBarItem(
          activeIcon: IconButton(
            icon: Icon(Icons.call,color: Theme.of(context).primaryColor,),
            onPressed: null,
          ),
          icon: IconButton(
            icon: Icon(Icons.call,color: Colors.grey,),
            onPressed: null,
          ),
          title: Text(
            "اتصل بنا",
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,fontSize: fromSize(25,context)),
          ),
        ),

        BottomNavigationBarItem(
          activeIcon: IconButton(
            icon: Icon(Icons.favorite,color: Theme.of(context).primaryColor,),
            onPressed: null,
          ),
          icon: IconButton(
            icon: Icon(Icons.favorite,color: Colors.grey,),
            onPressed: null,
          ),
          title: Text(
            "المفضلة",
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,fontSize: fromSize(25,context)),
          ),
        ),


      ],
    );
  }
}
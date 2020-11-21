


import 'package:flutter/material.dart';

class BottomBarController with ChangeNotifier {

  BuildContext context;
  int currentIndex = 1;
  TabController tabController;
  GlobalKey<ScaffoldState> scaffold = GlobalKey();


  BottomBarController();


  void openDrawer() {
    scaffold.currentState.openDrawer();
  }

  void closeDrawer() {
    Navigator.pop(context);
  }

  Future<bool> onBackPress()async {

    return true;
  }

  void initPageView(_viewPagerAllQuranState) async{
    if(tabController==null){
      tabController = new TabController(vsync: _viewPagerAllQuranState, length: 4,initialIndex: currentIndex);
    }
  }

  onTapBottom(index) {
    currentIndex = index;
    tabController.animateTo(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  void dispose() {

  }

}

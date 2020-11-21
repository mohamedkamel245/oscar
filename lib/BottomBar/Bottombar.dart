
import 'package:flutter/material.dart';
import 'package:oscar/About.dart';
import 'package:oscar/BottomBar/BottomBarController.dart';
import 'package:oscar/BottomBar/BottomNav.dart';
import 'package:oscar/FavoriteList.dart';
import 'package:oscar/Home.dart';
import 'package:oscar/CallUs.dart';
import 'package:provider/provider.dart';



class ProviderBottomBar extends StatelessWidget {
    final VoidCallback signOu;
  ProviderBottomBar(this.signOu);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BottomBarController()),
    ], child: BottomBar(signOu));
  }
}


class BottomBar extends StatefulWidget {
    final VoidCallback signOu;
  BottomBar(this.signOu);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin{


  BottomBarController controller;
  signOu(){
    setState(() {
      widget.signOu();
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    controller = Provider.of<BottomBarController>(context);
    controller.context = context;
    controller.initPageView(this);


    return WillPopScope(
      onWillPop: () async{
        return controller.onBackPress();
      },
      child: DefaultTabController(
        length: controller.tabController.length,
        child: Scaffold(
          key: controller.scaffold,
          drawer: Container(
            width: MediaQuery.of(context).size.width * 75 / 100,
            decoration: BoxDecoration(color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20,

                  )
                ],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
          body: TabBarView(
            physics: new NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: [
              About(),
              Home(signOu),
              CallUs(),
              FavoriteList(),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            onTap: controller.onTapBottom, // n// ew
            currentIndex: controller.currentIndex, //
          ),
        ),
      ),
    );
  }
}








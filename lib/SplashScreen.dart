import 'dart:async';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:oscar/AfterSplashScreen.dart';
import 'package:oscar/FadeRouteBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(FadeRouteBuilder(page: AfterSplashScreen()));
        }
      });
    Future.delayed(Duration(seconds: 3), () {
      animationController.forward();
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    margin: EdgeInsets.only(right: 80,left: 80),
                    child: ListTile(
                      title: FittedBox(
                        child: Text("دهانات",
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(blurRadius: 10, color:  Colors.grey.withOpacity(0.5))
                              ],
                              color: Color(0xFF00bfdb),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(right: 80,left: 80),
                    child: ListTile(
                      title: FittedBox(
                        child: Text("OSCAR",
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(blurRadius: 10, color: Colors.grey.withOpacity(0.5))
                              ],
                              color: Color(0xFF0090ff),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),


                ],
              ),
            ),


            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),


            Center(
              child: CircularRevealAnimation(
                centerAlignment: Alignment.bottomCenter,
                minRadius: 0,
                maxRadius: MediaQuery.of(context).size.height,
                // center: Offset(0, 0),
                child: Container(color: Colors.white),
                animation: animation,
              ),
            ),



          ],
        ));
  }
}

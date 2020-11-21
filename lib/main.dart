import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:oscar/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
      
      providers:[
        Provider(create: (context) => SplashScreen(),),
      ],
          child: MaterialApp(
        localizationsDelegates: [
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ],
 
 
 supportedLocales: [
   Locale('ar' , ''),
   
 ],
 theme: ThemeData(
   primaryColor: Color(0xFF00217e)
 ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}


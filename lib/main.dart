import 'dart:async';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new MyApp(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/percentage.png');
    Image image = Image(
      image: assetImage,
      width: 60.0,
      height: 60.0,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                Padding(padding: EdgeInsets.only(top:150.0),child: CircleAvatar(child: image,radius: 50.0,backgroundColor: Colors.white,),),
                Padding(padding: EdgeInsets.all(30.0),child:Center(child: Column(children: <Widget>[Text("SIMPLE INTEREST",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),Text("CALCULATOR",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))],) ,),),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      LinearProgressIndicator(valueColor:new AlwaysStoppedAnimation<Color>(Colors.pink),backgroundColor: Colors.indigo,),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      Text("Your App is Loading",style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(padding: EdgeInsets.only(top: 40.0)),

                    ],
                  ),
                ))
              ],))
          ),
        ));

  }
}

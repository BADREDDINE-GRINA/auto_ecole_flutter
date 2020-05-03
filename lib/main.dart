import 'package:appautoecoleflutter/series_list.dart';
import 'package:flutter/material.dart';


void main() => runApp(
    MaterialApp(

      debugShowCheckedModeBanner: false,
      home: AppRoute(),
    ));








class AppRoute extends StatefulWidget {

  @override
  _AppRouteState createState() => _AppRouteState();
}



class _AppRouteState extends State<AppRoute> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context,MaterialPageRoute(builder: (context) => SeriesList()), );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFF1AB77),Color(0xFFFEF0E5)])),
            child: Center(
              child: Text('Rousseau سلاسل',style: TextStyle(color: Color(0xFF3C223B),fontSize: 48.0,fontWeight: FontWeight.bold)),
            ),
          ),
        ));

  }



}


//child: Text('Rousseau سلاسل',style: TextStyle(color: Color(0xFF3C223B),fontSize: 35.0,fontWeight: FontWeight.bold))
//image: DecorationImage(image: AssetImage('images/fond.jpg'),fit: BoxFit.cover,),

import 'package:flutter/material.dart';
import 'list.dart';
import 'series_item.dart';

class SeriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF3C223B),
              size: 0.0,
            ),
            onPressed: () {}
        ),
        title: Text('Rousseau سلاسل',style: TextStyle(color: Color(0xFF3C223B),fontSize: 30.0,fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFFF1AB77),
                    Color(0xFFFEF0E5)
                  ])
          ),
        ),
      ),
//      appBar: GradientAppBar(
//        elevation: 6.0,
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back,
//              color: Color(0xFF3C223B),
//              size: 0.0,
//            ),
//            onPressed: () {}
//        ),
//        //iconTheme: IconThemeData(color: Color(0xFFFEF0E5),size: 0.0),
//        //backgroundColorStart: Color(0xFFF1AB77),
//        //backgroundColorEnd:Color(0xFFFEF0E5),
//
//        title: Text('Rousseau سلاسل',style: TextStyle(color: Color(0xFF3C223B),fontSize: 30.0,fontWeight: FontWeight.bold)),
//        centerTitle: true,
//      ),
      backgroundColor: Color(0xFFFEF0E5),
      body: GridView.builder(
        itemCount: list_numbers.length,

        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int serieIndex) {
          return Item(
            serieName: list_numbers[serieIndex],
            serieNumber: serieIndex+1,
          );
        },
      ),
    );
  }
}

//
//ListView(
//children: <Widget>[
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//
//Expanded(
//
//child: Container(
//decoration: BoxDecoration(
//
//borderRadius: BorderRadius.circular(7),
//color: Color(0xFFF1AB77),
//
//),
//child: Text(
//'سلسلة رقم 1 ',
//
//style:
//TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold,),
//),
//),
//),
//Expanded(child: Container())
//],
//),
//Row(
//children: <Widget>[],
//),
//],
////),
//child: Card(
//semanticContainer: true,
//color: Color(0xFF7EF0E5),
//
//child: Container(
//
//child: InkWell(
//onTap: () {},
//child: GridTile(child: Container(
//child: Center(child: Text(name)),
//)),
//)),
//),



















//
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Container(
//height: 50,
//padding: EdgeInsets.all(15.0),
//decoration:BoxDecoration(color: Color(0xFFF1AB77),borderRadius: BorderRadius.all(Radius.circular(13.0))),
//
//),
//);
import 'package:appautoecoleflutter/question_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Item extends StatelessWidget {

  final String serieName;
  final int serieNumber;

  Item({this.serieName,this.serieNumber});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen(serieNumber:serieNumber)));
      },

      child: Container(
        child: Center(child: Text(serieName,style:kTextButtonStyle)),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFF1AB77),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

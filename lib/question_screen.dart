import 'dart:ui';
import 'package:appautoecoleflutter/series_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:appautoecoleflutter/list.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';



class QuestionScreen extends StatefulWidget {
  int serieNumber;

  QuestionScreen({this.serieNumber});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool fafa;
  bool changecolor1 = false;
  bool changecolor2 = false;
  bool changecolor3 = false;
  bool changecolor4 = false;

  int score = 0;

  bool choice1 = false;
  bool choice2 = false;
  bool choice3 = false;
  bool choice4 = false;

  int questionNumber = 1;
  Future<void> showresult() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'لقد حصلت على$score اجابة صحيحة',
            style: TextStyle(
                color: score>31?Colors.green:Color(0xFFE85454),
                fontSize: 35.0,
                fontWeight: FontWeight.bold),
          ),
          //content: Text('$score',style:  TextStyle(color:Color(0xFF3C223B),fontSize: 30.0),),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Color(0xFF3C223B),
                  ),
                  Text(
                    'الرجوع',
                    style: TextStyle(color: Color(0xFF3C223B), fontSize: 23.0),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SeriesList()));
              },
            ),
            CupertinoDialogAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.autorenew,
                    size: 30.0,
                    color: Color(0xFF3C223B),
                  ),
                  Text(
                    'إعادة الإختبار',
                    style: TextStyle(color: Color(0xFF3C223B), fontSize: 23.0),
                  ),
                ],
              ),
              onPressed: () {
                resetQuiz();

              },
            ),
            CupertinoDialogAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  list_numbers.length>widget.serieNumber?Text(
                    'السلسلة المقبلة',
                    style: TextStyle(color: Color(0xFF3C223B), fontSize: 23.0),
                  ):null,
                  Icon(
                    Icons.navigate_next,
                    size: 30.0,
                    color: Color(0xFF3C223B),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen(serieNumber:widget.serieNumber+1),
                ) );
              },
            ),
          ],
        );
      },
    );
  }

  void updatescore() {
    var questionwidget = getserie(widget.serieNumber)[questionNumber - 1];
    if ((questionwidget['2'] == choice2) &&
        (questionwidget['1'] == choice1) &&
        (questionwidget['3'] == choice3) &&
        (questionwidget['4'] == choice4)) {
      score++;
      fafa = true;
    } else {
      fafa = false;
    }
  }

  void nextQuestion() {
    if (questionNumber < getserie(widget.serieNumber).length) {
      questionNumber++;
    } else {
      //print('baraka 3lik saliti');
      showresult();
    }
  }

  void resetQuiz() {
    setState(() {
      questionNumber = 1;
      score = 0;
      changecolor1 = false;
      changecolor2 = false;
      changecolor3 = false;
      changecolor4 = false;
      choice1 = false;
      choice2 = false;
      choice3 = false;
      choice4 = false;
    });
    Navigator.of(context).pop(context);

  }

  Widget f(bool a) {
    if (a == true) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }






  @override
  Widget build(BuildContext context) {
    // print('on est dans la question n $questionNumber');
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF3C223B),
              size: 35.0,
            ),
            onPressed: () { questionNumber = 1;
            score = 0;
            return Navigator.of(context).pop();}
        ),
        title: Text(
          ' سلسلة رقم${widget.serieNumber}',
          style: TextStyle(
              color: Color(0xFF3C223B),
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
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
//        //iconTheme: IconThemeData(color: Color(0xFFE85454),size: 50.0),
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back,
//              color: Color(0xFF3C223B),
//              size: 35.0,
//            ),
//            onPressed: () { questionNumber = 1;
//            score = 0;
//            return Navigator.of(context).pop();}
//        ),
//        // backgroundColorStart: Color(0xFFF1AB77),
//        //backgroundColorEnd:Color(0xFFFEF0E5),
//        elevation: 6.0,
//        title: Text(
//          ' سلسلة رقم${widget.serieNumber}',
//          style: TextStyle(
//              color: Color(0xFF3C223B),
//              fontSize: 30.0,
//              fontWeight: FontWeight.bold),
//        ),
//        centerTitle: true,
//      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                //l'image dans la liste
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                      getserie(widget.serieNumber)[questionNumber - 1]['img']),
                ),
                //child: Image.asset('images/screen_route.jpg'),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 7, right: 7.0, top: 30.0, bottom: 7.0),
                          child: FlatButton(
                            onPressed: () {
                              //numero 2 est tapé
                              setState(() {
                                //choice2 va devenir true ou bien false
                                choice2 = !choice2;
                                changecolor2 = !changecolor2;
                              });
                            },
                            child: Text(
                              'رقم 2',
                              style: changecolor2 == false
                                  ? kTextButtonStyle
                                  : kTextButtonStyleOnTap,
                            ),
                          ),
                          decoration: changecolor2 == false
                              ? kButtonDecoration
                              : kButtonDecorationOnTap,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 7, right: 7.0, top: 30.0, bottom: 7.0),
                          child: FlatButton(
                            onPressed: () {
                              //numero 1 est tapé
                              setState(() {
                                //choice2 va devenir true ou bien false
                                choice1 = !choice1;
                                changecolor1 = !changecolor1;
                              });
                            },
                            child: Text(
                              'رقم 1',
                              style: changecolor1 == false
                                  ? kTextButtonStyle
                                  : kTextButtonStyleOnTap,
                            ),
                          ),
                          decoration: changecolor1 == false
                              ? kButtonDecoration
                              : kButtonDecorationOnTap,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 7, right: 7.0, top: 7.0, bottom: 25.0),
                          child: FlatButton(
                            onPressed: () {
                              //numero 4 est tapé
                              setState(() {
                                //choice4 va devenir true ou bien false
                                choice4 = !choice4;
                                //le cas où il faut clicker sur le button 4

                                changecolor4 = !changecolor4;
                              });
                            },
                            child: Text(
                              'رقم 4',
                              style: changecolor4 == false
                                  ? kTextButtonStyle
                                  : kTextButtonStyleOnTap,
                            ),
                          ),
                          decoration: changecolor4 == false
                              ? kButtonDecoration
                              : kButtonDecorationOnTap,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 7, right: 7.0, top: 7.0, bottom: 25.0),
                          child: FlatButton(
                            onPressed: () {
                              //numero 3 est tapé
                              setState(() {
                                //choice3 va devenir true ou bien false
                                choice3 = !choice3;
                                //le cas où il faut clicker sur le button 3

                                changecolor3 = !changecolor3;
                              });
                            },
                            child: Text('رقم 3', style: changecolor3 == false
                                ? kTextButtonStyle
                                : kTextButtonStyleOnTap,),
                          ) ,
                          decoration:changecolor3 == false
                              ? kButtonDecoration
                              : kButtonDecorationOnTap,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                          EdgeInsets.only(left: 7, right: 7.0, top: 10.0),
                          child: FlatButton(
                            onPressed: () {
                              // store le resultat dans une liste
                              setState(() {
                                nextQuestion();
                                updatescore();
                                //print('score : $score');
                                changecolor1 = false;
                                changecolor2 = false;
                                changecolor3 = false;
                                changecolor4 = false;
                                choice1 = false;
                                choice2 = false;
                                choice3 = false;
                                choice4 = false;
                              });
                            },
                            child: Text('تابع', style: kTextButtonStyle),
                          ),
                          decoration: kButtonBottomDectoration,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: f(fafa),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:simplecalculator/ui/home_page.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    _mockCheckForSession().then((value) => _navigateToHome());
  } 

  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(milliseconds: 5000), (){});
    return true;
  }
  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context)=>HomePage()
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
              new Image.asset('assets/images/calc.png',
               height: 100.0,
               width: 100.0,),
              
              Shimmer.fromColors(
              child: Container(
                child: Text(
                  "Calculator",
                    style: new TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,	
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(80, 1.2)
                      )
                    ],
                    )
                ),
              ), 
              baseColor: Color(0xFFFB9B0C), 
              highlightColor: Color(0xFFFFFFFF),
              ),
						],
					)
      ),
    );
  }
}
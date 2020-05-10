import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "0";

  Widget buildButton(String value){
      return Expanded(
        child: new Container(
          margin: const EdgeInsets.all(4),
          child: new MaterialButton( 
            color: Color(0xFFFB9B0C), 
            padding: EdgeInsets.all(23.0),
            elevation: 2,
            child: new Text(value,
            style: new TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20.0,	
            ),),
            onPressed: ()=>buttonClicked(value)))
        );
  }

  buttonClicked(String button){
     if(button=="clear"){
          _output = "0";
          num1 = 0.0;
          num2 = 0.0;
          operand = "0";
     }else if(button =="+" || button =="-" || button =="*" || button =="/"){
          num1 = double.parse(output);
          operand = button;
          _output = "0";
     }else if(button=="."){
        if(_output.contains(".")){
          return;
        }else{
          _output = _output + button;
        }
     }else if(button=="="){
       num2 = double.parse(output);
       if(operand == "+"){
         _output = (num1+num2).toString();
       }
        if(operand == "-"){
         _output = (num1-num2).toString();
       }
        if(operand == "*"){
         _output = (num1*num2).toString();
       }
        if(operand == "/"){
         _output = (num1/num2).toString();
       }

       num1 = 0.0;
       num2 = 0.0;
       operand = "";
     }else{
       _output =_output+button;
     }
     setState(() {
       output = double.parse(_output).toStringAsFixed(2);
     });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
        backgroundColor: Color(0xFFFB9B0C), 
      ),
      backgroundColor: Colors.black,
      body: Container(
      padding: const EdgeInsets.all(10),
      child: new Column(
        children: <Widget>[
          new Container(
            //color: Color(0xFFFB9B0C), 
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Expanded(child: new Text(output,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              //backgroundColor: Color(0xFFFB9B0C), 
            ),)
            ),
          ),
          new Expanded(child: new Divider()),
          new Row(
            children: <Widget>[
             buildButton("7"),
             buildButton("8"),
             buildButton("9"),
             buildButton("/")
            ],
          ),
          new Row(
            children: <Widget>[
             buildButton("4"),
             buildButton("5"),
             buildButton("6"),
             buildButton("x")
            ],
          ),
          new Row(
            children: <Widget>[
             buildButton("1"),
             buildButton("2"),
             buildButton("3"),
             buildButton("-")
            ],
          ),
          new Row(
            children: <Widget>[
             buildButton("0"),
             buildButton("."),
             buildButton("00"),
             buildButton("+")
            ],
          ),
          new Row(
            children: <Widget>[
             buildButton("clear"),
             buildButton("=")
            ],
          )
        ],
      ),
      ),
    );
  }
}
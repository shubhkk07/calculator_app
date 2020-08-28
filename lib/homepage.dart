import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String output="0";
  String _output="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand ="";


  buttonpress(String buttontext) {


    if (buttontext == "CLEAR") {
       output = "0";
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";


    }else if (buttontext == "+" || buttontext == "-" || buttontext == "x" ||
        buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "";



    } else if (buttontext == ".") {

      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;

      } else {
        _output = _output + buttontext;
      }
    }

    else if (buttontext == "=") {

      num2 = double.parse(output);


      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    }else{

      _output = _output + buttontext;
    }

    print(output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }


  Widget buildbutton(String buttontext){
  return new Expanded(
      child: new OutlineButton(
          onPressed: () =>
              buttonpress(buttontext),
        padding: new EdgeInsets.all(24.0),
       child: new Text(buttontext,
       style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),),
       color: Colors.grey,
      ));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        child: new Column(
          children:<Widget>[
            new Container(
              padding: EdgeInsets.symmetric(
              vertical:68.0,
              horizontal: 20.0,
             ),
              alignment: Alignment.centerRight,
              child: new Text(output, style: TextStyle(
                fontSize: 58.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            new Expanded(
                child:new Divider() ),


            new Column(
             children: [
               new Row(
                 children: [
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/"),
              ],
            ),
               new Row(
                 children: [
                   buildbutton("4"),
                   buildbutton("5"),
                   buildbutton("6"),
                   buildbutton("x"),
                 ],
               ),
               new Row(
                 children: <Widget>[
                   buildbutton("1"),
                   buildbutton("2"),
                   buildbutton("3"),
                   buildbutton("+"),
                 ],
               ),
               new Row(
                 children: <Widget>[
                   buildbutton("."),
                   buildbutton("0"),
                   buildbutton("00"),
                   buildbutton("-"),
                 ],
               ),
               new Row(
                 children: <Widget>[
                   buildbutton("CLEAR"),
                   buildbutton("="),
                 ],
               )
          ],)]
        ),
      ),
    );
  }
}


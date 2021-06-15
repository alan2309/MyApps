import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';


const kDisplayBackStyle = TextStyle(fontSize: 38.0, color: Colors.black54);
const kDisplayFrontStyle = TextStyle(fontSize: 48.0, color: Colors.black);

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String equation = "0";
  String result = "0";
  String exp = "";
  int f = 0;
  TextStyle equationStyle = kDisplayBackStyle;
  TextStyle resultStyle = kDisplayFrontStyle;
  buttonPressed(String text) {
    setState(() {
      if (text == "C") {
        f = 0;
        equationStyle = kDisplayBackStyle;
        resultStyle = kDisplayFrontStyle;
        equation = "0";
        result = '0';
      } else if (text == "⌫") {
        f = 0;
        equationStyle = kDisplayFrontStyle;
        resultStyle = kDisplayBackStyle;
        if (equation.length == 1)
          equation = "0";
        else
          equation = equation.substring(0, equation.length - 1);
      } else if (text == "=") {
        f = 1;
        equationStyle = kDisplayBackStyle;
        resultStyle = kDisplayFrontStyle;
        exp = equation;
        exp = exp.replaceAll('x', '*');
        exp = exp.replaceAll('÷', '/');
        try {
          Parser p = new Parser();
          Expression expression = p.parse(exp);
          ContextModel cm = ContextModel();
          result = '${expression.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationStyle = kDisplayFrontStyle;
        resultStyle = kDisplayBackStyle;
        if (equation == "0")
          equation = text;
        else if (f == 0)
          equation += text;
        else {
          if (result.substring(result.length - 2, result.length) == ".0")
            equation = result.replaceAll(".0", '') + text;
          else
            equation = result + text;
        }
        f = 0;
      }
    });
  }

  Widget calcButton({String text, double buttonHeight, Color buttonColor}) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        onPressed: () {
          buttonPressed(text);
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        )),
        child: Text(
          text,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: equationStyle),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: resultStyle,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        calcButton(
                            text: "C",
                            buttonColor: Colors.redAccent,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "⌫",
                            buttonColor: Colors.blue,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "÷",
                            buttonColor: Colors.blue,
                            buttonHeight: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        calcButton(
                            text: "7",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "8",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "9",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        calcButton(
                            text: "4",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "5",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "6",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        calcButton(
                            text: "1",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "2",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "3",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        calcButton(
                            text: ".",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "0",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                        calcButton(
                            text: "00",
                            buttonColor: Colors.black54,
                            buttonHeight: 0.1),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        calcButton(
                            text: 'x',
                            buttonColor: Colors.blue,
                            buttonHeight: 0.1),
                      ]),
                      TableRow(children: [
                        calcButton(
                            text: '-',
                            buttonColor: Colors.blue,
                            buttonHeight: 0.1),
                      ]),
                      TableRow(children: [
                        calcButton(
                            text: '+',
                            buttonColor: Colors.blue,
                            buttonHeight: 0.1),
                      ]),
                      TableRow(children: [
                        calcButton(
                            text: '=',
                            buttonColor: Colors.redAccent,
                            buttonHeight: 0.2),
                      ]),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

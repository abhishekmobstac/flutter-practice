import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int firstVal = 0;
  int secondVal = 0;
  String textToDisplay = '';
  String res = '';
  String operator = '';

  String addition(int firstVal, int secondVal) {
    return (firstVal + secondVal).toString();
  }

  String subtraction(int firstVal, int secondVal) {
    return (firstVal - secondVal).toString();
  }

  String multiplication(int firstVal, int secondVal) {
    return (firstVal * secondVal).toString();
  }

  String division(int firstVal, int secondVal) {
    return (firstVal / secondVal).toString();
  }

  String percentage(int firstVal, int secondVal) {
    return ((firstVal / secondVal) * 100).toString();
  }

  String signChange(int firstVal) {
    return (firstVal * (-1)).toString();
  }

  clear() {
    textToDisplay = "";
    firstVal = 0;
    secondVal = 0;
    res = "";
  }

  void operationToDo(String opt) {
    firstVal = int.parse(textToDisplay);
    res = "";
    operator = opt;
  }

  void handlePress(String val) {
    // can use include here, but not getting how to implement it
    if (val == "+" || val == "-" || val == "÷" || val == "x" || val == "%") {
      operationToDo(val);
    } else {
      switch (val) {
        case "+/-":
          firstVal = int.parse(textToDisplay);
          res = signChange(firstVal);
          break;
        case "AC":
          clear();
          break;
        case "=":
          secondVal = int.parse(textToDisplay);
          switch (operator) {
            case "+":
              res = addition(firstVal, secondVal);
              break;
            case "-":
              res = subtraction(firstVal, secondVal);
              break;
            case "x":
              res = multiplication(firstVal, secondVal);
              break;
            case "÷":
              res = division(firstVal, secondVal);
              break;
            case "%":
              res = percentage(firstVal, secondVal);
              break;
          }
          break;

        default:
          res = int.parse(textToDisplay + val).toString();
      }
    }
    setState(() {
      textToDisplay = res;
    });
  }

  // custom widget for the buttons of the calculator
  Widget customButton(String val, Color bgColor) {
    return Expanded(
      flex: val == "0" ? 2 : 1,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
        onPressed: () => handlePress(val),
        child: Text(
          val,
          style: const TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color peach = const Color.fromARGB(255, 255, 149, 0);
    Color grey = const Color.fromARGB(255, 80, 80, 80);
    Color lightgrey = const Color.fromARGB(255, 132, 128, 128);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculator"),
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              color: Colors.grey[200],
              child: Text(
                textToDisplay,
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )),
            Row(
              children: <Widget>[
                customButton("AC", grey),
                customButton("+/-", grey),
                customButton("%", grey),
                customButton("÷", peach),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("7", lightgrey),
                customButton("8", lightgrey),
                customButton("9", lightgrey),
                customButton("x", peach)
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4", lightgrey),
                customButton("5", lightgrey),
                customButton("6", lightgrey),
                customButton("-", peach)
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1", lightgrey),
                customButton("2", lightgrey),
                customButton("3", lightgrey),
                customButton("+", peach)
              ],
            ),
            Row(
              children: <Widget>[
                customButton("0", lightgrey),
                customButton(".", lightgrey),
                customButton("=", peach)
              ],
            )
          ],
        ),
      ),
    );
  }
}

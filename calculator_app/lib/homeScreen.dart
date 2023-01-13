// ignore: file_names
import 'package:calculator_app/buton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _history = "";
  String _expression = "";

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCal(
                      text: "AC",
                      callback: allClear,
                      fillColor: Colors.grey,
                      textSize: 20),
                  ButtonCal(
                    text: "C",
                    callback: clear,
                    fillColor: Colors.grey[700],
                  ),
                  ButtonCal(
                    text: "%",
                    callback: numClick,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                  ),
                  ButtonCal(
                    text: "/",
                    callback: numClick,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCal(
                    text: "7",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "8",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "9",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "*",
                    callback: numClick,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                    textSize: 24,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCal(
                    text: "4",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "5",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "6",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "-",
                    callback: numClick,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                    textSize: 38,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCal(
                    text: "1",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "2",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "3",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "+",
                    callback: numClick,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                    textSize: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCal(
                    text: ".",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "0",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "00",
                    callback: numClick,
                    textSize: 26,
                  ),
                  ButtonCal(
                    text: "=",
                    callback: evaluate,
                    fillColor: Colors.grey[700],
                    textColor: Colors.blue[200],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

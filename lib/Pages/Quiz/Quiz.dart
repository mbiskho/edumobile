import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:js';
import './PreQuiz.dart';
import './QuizResult.dart';
class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Color pilihan = Colors.white;
  Color benar = Colors.green;
  Color salah = Colors.red;
  int total = 0;
  int countersoal = 1;
  bool disableans = false;

  Map<String, Color> coloropsi = {
    "ssatu" : Colors.white,
    "sdua" : Colors.white,
    "stiga" : Colors.white,
    "sempat" : Colors.white,
  };

  void setState(fn){
    if (mounted) {
      super.setState(fn);
    }
  }

  void nextquestion(){
    setState(() {
      if (countersoal < 10){
        countersoal++;
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => (QuizResult())));
      }
      coloropsi["ssatu"] = Colors.white;
      coloropsi["sdua"] = Colors.white;
      coloropsi["stiga"] = Colors.white;
      coloropsi["sempat"] = Colors.white;
      disableans = false;
    });
  }

  void checkanswer(String opsi){
    disableans = true;
    if (opsi == "ssatu"){
      total+=10;
      pilihan = benar;
    }
    else {
      pilihan = salah;
    }

    setState(() {
      coloropsi[opsi] = pilihan;
      disableans = true;
    });

    Timer(Duration(seconds: 3),nextquestion);
  }

  Widget Opsi(String Opsi) {
    return Container(
                width: 280,
                height: 40,
                decoration: BoxDecoration(
                    color: coloropsi[Opsi],
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    )),
                child: RaisedButton(
                    onPressed: () {
                      checkanswer(Opsi);
                    },
                    textColor: Colors.black,
                    color: coloropsi[Opsi],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: coloropsi[Opsi],
                          child: Text(
                            Opsi,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Stack(
        children: [
          SafeArea(
              child: Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Spacer(),
            Text(
              ("Question " + countersoal.toString()),
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "This is question",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SafeArea(child: AbsorbPointer(
              absorbing: disableans,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Opsi("ssatu"),
                    const SizedBox(height: 15),
                    Opsi("sdua"),
                    const SizedBox(height: 15),
                    Opsi("stiga"),
                    const SizedBox(height: 15),
                    Opsi("sempat"),
                  ],
                ),
              ),
            )),
            Spacer(),
          ]))),
        ],
      ),
    );
  }
}


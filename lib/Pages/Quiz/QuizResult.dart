import 'package:flutter/material.dart';

class QuizResult extends StatefulWidget {
  int total = 0;
  @override 
  _QuizResult createState() => _QuizResult();
}

class _QuizResult extends State<QuizResult> {
  
  Widget Balik() {
    return Container(
                width: 280,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    )),
                child: RaisedButton(
                    onPressed: () {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    },
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: Text(
                            "Kembali?",
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
              ("SELAMAT ANDA MENDAPATKAN"),
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "SKOR : 100",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Balik(),
            Spacer(),
          ]))),
        ],
      ),
    );
  }
}

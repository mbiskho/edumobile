import 'package:flutter/material.dart';
import 'package:kusis_flutt/src/screens/Quiz.dart';

class PreQuiz extends StatefulWidget {
  PreQuiz({Key? key}) : super(key: key);

  @override
  _PreQuizState createState() => _PreQuizState();
}

class _PreQuizState extends State<PreQuiz> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[90],
      body: Stack(
        children: [
          SafeArea(
              child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                //const SizedBox(height: 100),
                Text(
                  "Judul Quiz",
                  style: TextStyle(fontSize: 38, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Part 1",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  textAlign: TextAlign.center,
                ),

                Spacer(),
                Container(
                    width: 160,
                    height: 55,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Quiz()));
                        },
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Colors.black,
                              child: Text(
                                '  Begin',
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ))),

                const SizedBox(height: 20),
                Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
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
                                'Back',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ))),

                Spacer(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}




import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Routing App'),
      ),

      body : Center(
        child : Text('Ini Intro')
      )
    );
  }
}
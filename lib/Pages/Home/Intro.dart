import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E2761),
      body: Stack(
        children: [
         Padding(
           padding: const EdgeInsets.all(50),
           child: Image.asset(
                "assets/onboarding_image.png",
                width: 250,
                height: 200,
              ),
         ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 350),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Find The Best\nOnline Course',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,),
                  child: Text(
                    'Learn new profesional from the comfort of of your home anywhere',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff838282),
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xff7A2048),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        '/home',
                        arguments: 'Hello there from the first page!',
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

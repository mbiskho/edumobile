import 'package:eduakhir/Pages/Dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

import './route_generator.dart';


void main() {
  runApp(MaterialApp(home: Dashboard(),));
}

// class Main extends StatelessWidget {
//   const Main({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title : 'Eduspace',
//       theme : ThemeData(

//       ),
//       initialRoute: '/',
//       onGenerateRoute: RouteGenerator.generateRoute,
//     );
//   }
// }
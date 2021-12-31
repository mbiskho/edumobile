import 'package:flutter/material.dart';
import './main.dart';

import './Pages/Home/Intro.dart';
import './Pages/Home/Home.dart';
import './Pages/Dashboard/Dashboard.dart';
import './Pages/Profile/Profile.dart';
import './Pages/AUTH/Login.dart';
import './Pages/AUTH/Register.dart';
import './Pages/Quiz/PreQuiz.dart';
import './Pages/Quiz/Quiz.dart';
import './Pages/Course/Content.dart';
import './Pages/Course/CourseList.dart';
import './Pages/Course/CourseOverview.dart';
import './Pages/FAQ/FAQ.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    print(args);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case '/home':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Home(
                  // data: args,
                ),
          );
        }
        return _errorRoute();
      case '/course/content':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Content(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/course':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => CourseList(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/course/overview':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => CourseOverview(
                // data: args,
            ),
          );
        }
        return _errorRoute();
      

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Dashboard(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/profile':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Profile(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/login':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyLogin(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/logout':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyRegForm(
                  // data: args,
                ),
          );
        }
        return _errorRoute();

      case '/faq':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => FAQScreen(
                  // data: args,
                ),
          );
        }
        return _errorRoute();
        
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
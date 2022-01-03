import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseOverview extends StatefulWidget {
  
  late String text;

  CourseOverview(String text){
    this.text = text;
    print(text);
  }

  @override
  _CourseOverviewState createState() => _CourseOverviewState(this.text);
}

class _CourseOverviewState extends State<CourseOverview> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxfSwiaWF0IjoxNjQxMjE2OTIyLCJleHAiOjE2NDEyMjA1MjJ9.pthSw7xUqqRQ5E1t4_tdKlYf8Rai9jN5eWL25mBw_Wk';
  var ImageCourse = '';
  var title = '';
  var user = 0;
  var univ = '';
  var subject = '';
  bool IsTaken = false;
  var ids = '';

  _CourseOverviewState(String id){
    this.ids = id;
    GetCourse();
  }

  GetCourse() async{
    
   String URL = 'https://eduspace-api.herokuapp.com/api/course/specific?id=$ids';
   print(URL);
    final response = await http
      .get(Uri.parse(URL),
      headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      });
    var jsonData = jsonDecode(response.body);
    
    setState((){
      IsTaken = jsonData['isEnroll'];
      ImageCourse = jsonData['course']['thumbnail'];
      title = jsonData['course']['title'];
      user = jsonData['course']['users'];
      subject = jsonData['course']['subject'];
      univ = jsonData['course']['university'];
    });

  }

  @override
  void initState() {
    super.initState();
    GetCourse();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child : ListView(
          children: [
            Container(
              child : Image.network(
                ImageCourse
              ),
            ),
            SizedBox( height : 20),
            Container(
              child : Text(title, 
                style : TextStyle(fontSize:22, fontWeight: FontWeight.bold)
              ),
              margin :  const EdgeInsets.symmetric(horizontal : 35),
            ),
            Container(
              child : Text(univ, 
                style : TextStyle(fontSize:15, fontWeight: FontWeight.w500)
              ),
              margin :  const EdgeInsets.symmetric(horizontal : 35),
            ),

            SizedBox( height : 5),
            
            Container(
              child : Text(subject, 
                style : TextStyle(fontSize:14, fontWeight: FontWeight.w400, color : Colors.grey)
              ),
              margin :  const EdgeInsets.symmetric(horizontal : 35),
            ),

            Container(
              child : Text("$user students", 
                style : TextStyle(fontSize:13, fontWeight: FontWeight.w400)
              ),
              margin :  const EdgeInsets.symmetric(horizontal : 35),
            ),

            SizedBox( height :10),

            Container(
              margin :  const EdgeInsets.symmetric(horizontal : 35),
              child : Text('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to',
                style : TextStyle(fontSize:12, fontWeight: FontWeight.w400)
              )
            ),

            Padding(
              child :ElevatedButton(
              onPressed: () {
                          Navigator.of(context).pushNamed(
                          '/course/content',
                           arguments: '1',
                           );
                              },
                              style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 40),
                              primary : Colors.black87 // put the width and height you want
                            ), 
                            child: Container(
                          child :  Image.asset('assets/images/PolygonWhite.png') 
                          ),
              ),
              padding : EdgeInsets.all(50.0) 
            )
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index){
          if(index == 0){
            Navigator.of(context).pushNamed(
              '/home',
              arguments: 'Hello there from the first page!',
            );
          }else if(index == 1){
            Navigator.of(context).pushNamed(
              '/course',
              arguments: 'Hello there from the first page!',
            );
          }else if(index == 2){
            Navigator.of(context).pushNamed(
              '/profile',
              arguments: 'Hello there from the first page!',
            );
          }
        },
      ),
    );
  }
}


Future<Course> fetchCourse(String token, String id) async {
   String URL = 'https://eduspace-api.herokuapp.com/api/course/specific?id=$id';
  final response = await http
      .get(Uri.parse(URL),
      headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Course.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load course');
  }
}

class Course{
  int courseId;
  String title;
  String university;
  String subject;
  String thumbnail;
  bool isEnrolled;

  Course({
    required this.courseId,
    required this.title,
    required this.university,
    required this.subject,
    required this.thumbnail,
    required this.isEnrolled
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId : json['course']["courseId"],
      title : json['course']["title"],
      university : json['course']["university"],
      subject : json['course']["subject"],
      thumbnail : json['course']["thumbnail"],
      isEnrolled : json["isEnrolled"]
    );
  }
}


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './CourseOverview.dart';

class CourseList extends StatefulWidget {
  CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15), primary : Colors.teal );

  String UrlGetAll = 'https://eduspace-api.herokuapp.com/api/user';
  String UrlFilter = '';
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxfSwiaWF0IjoxNjQwNzcyMjc5LCJleHAiOjE2NDA3NzU4Nzl9.MTywLXMdVcjJqYSoz9o0h-kRYla2OPIAVQ7Re1s2s-c';
  List AllCourses = [
    {
            "id": 1,
            "title": "Digital   Engagement",
            "university": "Universitas Indonesia",
            "users": 0,
            "subject": "Technology",
            "thumbnail": "https://cdn.discordapp.com/attachments/755605623214964900/923835788020564049/Digital.png"
        },
        {
            "id": 2,
            "title": "Discreate Mathematics",
            "university": "Universitas Indonesia",
            "users": 0,
            "subject": "Science",
            "thumbnail": "https://cdn.discordapp.com/attachments/755605623214964900/923835788511281182/Math.jpeg"
        },
        {
            "id": 3,
            "title": "Drawing",
            "university": "President University",
            "users": 0,
            "subject": "Technology",
            "thumbnail": "https://cdn.discordapp.com/attachments/755605623214964900/923835788272230400/Drawing.jpg"
        },
        {
            "id": 4,
            "title": "Development Operations",
            "university": "Institut Teknologi Bandung",
            "users": 0,
            "subject": "Technology",
            "thumbnail": "https://cdn.discordapp.com/attachments/755605623214964900/923835787768909874/Enggris.png"
        }
  ];

  String found = "3 Courses found";

  List WidgetKursus = [];

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        // backgroundColor: Color(0x44000000),
        elevation: 0,
        
      ),
      body : Container(
        margin : const EdgeInsets.symmetric(horizontal : 35),
        child : ListView(
          
          children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Course",
                style : TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
              
              
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Find Course you want to learn",
                style : TextStyle(fontSize: 15)
              ),
              margin : const EdgeInsets.symmetric(vertical : 10)
            ),
          ),

          SizedBox(height : 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                found,
                style : TextStyle(fontSize: 15)
              ),
              margin : const EdgeInsets.symmetric(vertical : 10)
            ),
          ),
         
          SizedBox(height :2),
           Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  boxShadow: [
                      BoxShadow(color: Colors.black, spreadRadius: 2),
                  ],
                ),
              height: 120,
              // color : Colors.teal,
              child : Padding(
                padding: EdgeInsets.all(10.0),
                child : Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Container(
                          
                          // color: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          child : Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[0]['title'],
                                    style : TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                  
                                  
                                ),
                              ),
                              SizedBox(height : 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[0]['university'],
                                    style : TextStyle(fontSize: 13, fontWeight: FontWeight.w400)
                                  ),  
                                ),
                              ),
                              SizedBox(height : 2),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    "10 Students",
                                    style : TextStyle(fontSize: 10, fontWeight: FontWeight.w400)
                                  ),
                                ),
                              ),
                              Expanded(
                                child : ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: entries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      color: Colors.amber[colorCodes[index]],
                                      child: Center(child: Text('Entry ${entries[index]}')),
                                    );
                                  }
                                )
                              )
                            ]
                          )
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.yellow,
                          child : Column(
                            children : [
                              SizedBox(height :23),
                              ElevatedButton(
                                onPressed: () {
                                   Navigator.of(context).pushNamed(
                                      '/course/overview',
                                      arguments: '0',
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
                            ]
                          )
                        ),
                      ),
                  ],
                )
                
              ),

              
            ),
            Container(
              width: double.infinity,
              margin:  const EdgeInsets.symmetric(vertical : 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  boxShadow: [
                      BoxShadow(color: Colors.black, spreadRadius: 2),
                  ],
                ),
              height: 120,
              // color : Colors.teal,
              child : Padding(
                padding: EdgeInsets.all(10.0),
                child : Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Container(
                          
                          // color: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          child : Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[1]['title'],
                                    style : TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                  
                                  
                                ),
                              ),
                              SizedBox(height : 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[1]['university'],
                                    style : TextStyle(fontSize: 13, fontWeight: FontWeight.w400)
                                  ),  
                                ),
                              ),
                              SizedBox(height : 2),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    "14 Students",
                                    style : TextStyle(fontSize: 10, fontWeight: FontWeight.w400)
                                  ),
                                ),
                              ),
                              Expanded(
                                child : ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: entries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      color: Colors.amber[colorCodes[index]],
                                      child: Center(child: Text('Entry ${entries[index]}')),
                                    );
                                  }
                                )
                              )
                            ]
                          )
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.yellow,
                          child : Column(
                            children : [
                              SizedBox(height :23),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  CourseOverview(),
                                      // Pass the arguments as part of the RouteSettings. The
                                      // DetailScreen reads the arguments from these settings.
                                      settings: RouteSettings(
                                        arguments: "1",
                                      ),
                                    ),
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
                            ]
                          )
                        ),
                      ),
                  ],
                )
                
              ),
            ),

            Container(
              width: double.infinity,
              margin:  const EdgeInsets.symmetric(vertical : 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  boxShadow: [
                      BoxShadow(color: Colors.black, spreadRadius: 2),
                  ],
                ),
              height: 120,
              // color : Colors.teal,
              child : Padding(
                padding: EdgeInsets.all(10.0),
                child : Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Container(
                          
                          // color: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          child : Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[3]['title'],
                                    style : TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                  
                                  
                                ),
                              ),
                              SizedBox(height : 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    AllCourses[3]['university'],
                                    style : TextStyle(fontSize: 13, fontWeight: FontWeight.w400)
                                  ),  
                                ),
                              ),
                              SizedBox(height : 2),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    "20 Students",
                                    style : TextStyle(fontSize: 10, fontWeight: FontWeight.w400)
                                  ),
                                ),
                              ),
                              Expanded(
                                child : ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: entries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      color: Colors.amber[colorCodes[index]],
                                      child: Center(child: Text('Entry ${entries[index]}')),
                                    );
                                  }
                                )
                              )
                            ]
                          )
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.yellow,
                          child : Column(
                            children : [
                              SizedBox(height :23),
                              ElevatedButton(
                                onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      '/course/overview',
                                      arguments: '3',
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
                            ]
                          )
                        ),
                      ),
                  ],
                )
                
              ),
            ),
          ],
          

        )
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
              '/',
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
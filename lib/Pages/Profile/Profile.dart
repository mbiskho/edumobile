import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './edit_profile.dart';
import './api.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  get name => null;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  int _selectedIndex = 2;
  // Profiles data = Profiles().getProfile() as Profiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F9FC),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffbcbcbc),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "No Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: const Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 125,
                          child: Column(
                            children: const [
                              Text(
                                "350",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Courses")
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black45,
                          height: 50,
                          width: 1,
                        ),
                        SizedBox(
                          width: 125,
                          child: Column(
                            children: const [
                              Text(
                                "12090",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Points")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          side:
                              const BorderSide(width: 0.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()));
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 350,
              child: const Text(
                "Overview",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      color: Colors.white,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side:
                              const BorderSide(width: 0.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 125,
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.inbox,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              child : Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: const Text("Dashboard",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            onTap: (){
                              print("Go Dashboard");
                              Navigator.of(context).pushNamed(
                                '/dashboard',
                                arguments: 'Hello there from the first page!',
                              );
                            }
                            )
                          ],
                        ),
                        label: const Text(
                          "",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side:
                              const BorderSide(width: 0.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 125,
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.list_alt,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              child : Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: const Text("FAQ",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            onTap:(){
                                Navigator.of(context).pushNamed(
                                '/faq',
                                arguments: 'Hello there from the first page!',
                              );
                            },
                            ),
                          ],
                        ),
                        label: const Text(
                          "",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.black45,
                      height: 1,
                      width: 350,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side:
                              const BorderSide(width: 0.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 125,
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: const Text("Logout",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                        label: Text(
                          "",
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
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

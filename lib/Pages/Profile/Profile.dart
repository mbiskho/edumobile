import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    child: Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: const CircleAvatar(
                        radius: 50,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Nama",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 125,
                          child: Column(
                            children: [Text("350"), Text("Courses")],
                          ),
                        ),
                        Container(
                          color: Colors.black45,
                          height: 50,
                          width: 1,
                        ),
                        Container(
                          width: 125,
                          child: Column(
                            children: [Text("12090"), Text("Points")],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Colors.black),
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
                        child: Text(
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
              margin: EdgeInsets.only(top: 20),
              width: 350,
              child: Text(
                "Overview",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      color: Colors.white,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Colors.black),
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
                              child: Icon(
                                Icons.inbox,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: Text("Dashboard",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                        label: Text(
                          "",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Colors.black),
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
                              child: Icon(
                                Icons.list_alt,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: Text("Details",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                        label: Text(
                          "",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.black45,
                      height: 1,
                      width: 350,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Colors.black),
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
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 125,
                              alignment: Alignment.centerRight,
                              child: Text("Logout",
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
    );
  }
}

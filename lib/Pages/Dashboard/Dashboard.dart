import 'dart:convert';

import 'package:eduakhir/Pages/Course/CourseList.dart';
import 'package:eduakhir/Pages/Dashboard/repository.dart';
import 'package:flutter/material.dart';
import './course.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Course> listCourse = [];
  Repository repo = Repository();
  Container latestCourses = new Container();

  fetchCourses() async {
    listCourse = await repo.fetchCourses();
  }

  Widget buildImageCard(fotonya) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(
                "assets/$fotonya",
              ),
              width: 350,
              height: 350,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {},
              ),
            ),
            Text(
              'Latest',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  // _buatList()async{
  //   for(var i = 0; i< 3; i++){
  //     final futunya = futu[futu.length-1-i];
  //     latestCourse.add(
  //       new Container(
  //         child:
  //          new Card(
  //            child: new Column(children: <Widget>[
  //              Image.asset("assests/$gambar", fit: BoxFit.cover,),
  //              Padding(padding: new EdgeInsets.all(10),),
  //              if (futunya["nama"]!.isEmpty) Text(futunya["nama"]),
  //            ],
  //            )

  //       )
  //     ));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF6F9FC),
        body: Center(
          child: Container(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Latest Course",
                    style: TextStyle(color: Colors.black)),
                new Row(
                  children: <Widget>[
                    for (int i = 1; i < 3; i++) buildImageCard(listCourse[i].thumbnail),
                  ],
                ),
                // new Row(crossAxisAlignment: 2, children: [
                //   for (int i = 1; i < 3; i++) buildImageCard('IMG_' + (i+1).toString() + '.jpg'),
                // ],),

                // new GridView.count(crossAxisCount: 3, children: latestCourse),
                new Container(
                    child: new Row(
                  children: <Widget>[],
                )),
                new Padding(padding: EdgeInsets.all(16.0)),
                const Text(
                  "Your Courses",
                  style: TextStyle(color: Colors.black),
                ),
                for (int i = 0; i < 3; i++)
                  buildCourses(listCourse[i].title,
                      listCourse[i].users + ' students')
              ],
            ),
          )),
        ));
    // return Container();
    // return MaterialApp(
    //   title: 'Eduspace Courses',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blueGrey,
    //   ),
    //   home: const MyHomePage(title: 'Latest Course'),
    // );
  }
  //       body: Container(
  //         padding: EdgeInsets.all(16.0),
  //         child: SingleChildScrollView(
  //             scrollDirection: Axis.vertical,
  //             child: Column(
  //               children: [
  //                 buildCard('Math', 'By: Pavita'),
  //                 buildCard('Science', 'By: Ipul'),
  //                 buildCard('Geography', 'By: Sarah'),
  //                 buildCard('Psychology', 'By: Lala'),
  //                 buildCard('Computer', 'By: Cinta'),
  //                 buildCard('Culinary', 'By: Ika'),
  //                 buildCard('Chemistry', 'By: Sandra'),
  //               ],
  //             )),
  //       ));
  // }

  // Container buildLatest(title) {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     child: new Card(
  //       child:
  //       new Column(children: [
  //         Image
  //         Text(title),
  //       ],)

  //   );
  // }

  Container buildCourses(title, subtitle) {
    return Container(
        child: Container(
      margin: const EdgeInsets.all(10),
      width: 350,
      height: 70,
      color: Colors.white,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          side: const BorderSide(width: 0.5, color: Colors.black),
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
                Icons.smart_display_outlined,
                color: Colors.black,
              ),
            ),
            Container(
              width: 150,
              alignment: Alignment.centerRight,
              child: ListTile(
                title: Text(title, style: TextStyle(color: Colors.black)),
                subtitle: Text(subtitle),
              ),
            ),
          ],
        ),
        label: const Text(
          "",
        ),
      ),
    ));
  }
}
//   get listCourse => fetchCourses();
//   Container latestCourses = new Container();
//   Container buildCourses(title, subtitle) {
//     return Container(
//         child: Container(
//       margin: const EdgeInsets.all(10),
//       width: 350,
//       height: 70,
//       color: Colors.white,
//       child: TextButton.icon(
//         style: TextButton.styleFrom(
//           side: const BorderSide(width: 0.5, color: Colors.black),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         onPressed: () {},
//         icon: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               width: 125,
//               alignment: Alignment.centerLeft,
//               child: const Icon(
//                 Icons.smart_display_outlined,
//                 color: Colors.black,
//               ),
//             ),
//             Container(
//               width: 150,
//               alignment: Alignment.centerRight,
//               child: ListTile(
//                 title: Text(title, style: TextStyle(color: Colors.black)),
//                 subtitle: Text(subtitle),
//               ),
//             ),
//           ],
//         ),
//         label: const Text(
//           "",
//         ),
//       ),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xffF6F9FC),
//         body: Center(
//           child: Container(
//               child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text("Latest Course",
//                     style: TextStyle(color: Colors.black)),
//                 // new Row(crossAxisAlignment: 3)
//                 // for (int i = 0; i < 3; i++)
//                 //   buildImageCard('IMG_' + futu[i].gambar + '.jpg'),
//                 // new GridView.count(crossAxisCount: 3, children: latestCourse),
//                 new Container(
//                     child: new Row(
//                   children: <Widget>[],
//                 )),
//                 const Text(
//                   "Your Courses",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 for (int i = 0; i < 3; i++)
//                   latestCourses = buildCourses(
//                       listCourse[i+1].title.toString(),
//                       listCourse[i+1].users.toString() + ' students'),
//                 new Row(children: [latestCourses]),
//               ],
//             ),
//           )),
//         ));
//   }
// }

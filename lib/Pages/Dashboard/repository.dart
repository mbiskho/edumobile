import 'dart:convert';

import 'package:http/http.dart' as http;

import 'course.dart';


class Repository{
  Future fetchCourses() async {
      try{
        final response = await http.get(Uri.parse("https://eduspace-api.herokuapp.com/"));
        if (response.statusCode == 200) {
          Iterable data = jsonDecode(response.body);
          List<Course> courses = data.map((e) => Course.fromJson(e)).toList();
          return courses;
        }
      }catch(e){
        print(e.toString());
      }
    }
}
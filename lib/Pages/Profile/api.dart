import 'dart:convert';

import 'package:http/http.dart' as http;
import './Profile.dart';

class Course {}

class Profiles {
  int id;
  String name;
  String username;
  String urlimage;
  String auth;
  List<Course> course;

  Profiles({
    required this.id,
    required this.name,
    required this.username,
    required this.urlimage,
    required this.auth,
    required this.course,
  });

  Future<Profiles> getProfile() async {
    const url = 'https://eduspace-api.herokuapp.com/api/user';
    String token = auth;

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data =
          (json.decode(response.body))['profile'] as Map<String, dynamic>;
      return Profiles(
          id: data['id'],
          name: data['name'],
          username: data['username'],
          urlimage: data['urlimage'],
          auth: data['auth'],
          course: (json.decode(response.body))['courses']);
    } else {
      throw Exception();
    }
  }

  Future<void> updateProfile(String newName, String newImage) async {}
}

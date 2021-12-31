import 'dart:convert';

import 'package:http/http.dart' as http;

class Course {
  String id;
  String title;
  String university;
  String users;
  String subject;
  String thumbnail;

  Course({
    required this.id,
    required this.title,
    required this.university,
    required this.users,
    required this.subject,
    required this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> data) {
    return Course(
      id: data['id'],
      title: data['title'],
      university: data['university'],
      users: data['users'],
      subject: data['subject'],
      thumbnail: data['thumbnail'],
    );
  }
}

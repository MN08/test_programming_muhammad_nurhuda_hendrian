import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import './model/students.dart';

class Repository {
  final _baseUrl = "https://hiringmobile.qtera.co.id";

  Future getStudentData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + "/students"));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Students> student = it.map((e) => Students.fromJson(e)).toList();
        print(student);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future addStudentData(String name, String gender, DateTime birthDate,
      String province, String city, String photo) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + "/students"),
        headers: {"Content-Type": "application/json"},
        body: {
          "name": name,
          "gender": gender,
          "birthDate": birthDate,
          "province": city,
          "photo": photo,
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

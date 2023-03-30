import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart';
import '../model/city.dart';
import '../model/province.dart';
import '../model/students.dart';

import '../config/app_url.dart';

class StudentSource {
  static Future<bool> addStudent(
    String name,
    String gender,
    DateTime birthDate,
    Province province,
    City city,
    String photo,
  ) async {
    String url = Api.student;
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'name': name,
        'gender': gender,
        'birthDate': birthDate,
        'province': province,
        'city': city,
        'photo': photo
      });
      DMethod.printTitle('Student Source - Add Student', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Student Source - Add Student', e.toString());
      return false;
    }
  }

  static Future<bool> updateStudent(
    String name,
    String gender,
    DateTime birthDate,
    Province province,
    City city,
    String photo,
  ) async {
    String url = Api.student;
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'name': name,
        'gender': gender,
        'birthDate': birthDate,
        'province': province,
        'city': city,
        'photo': photo
      });
      DMethod.printTitle('Topic Source - Update Topic', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Topic Source - Update Topic', e.toString());
      return false;
    }
  }

  static Future<List<Student>> getAllStudent() async {
    String url = Api.student;
    try {
      Response response = await Client().get(Uri.parse(url));
      DMethod.printTitle('Student Source - Get All Student', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Student.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Student Source - Get All Student', e.toString());
      return [];
    }
  }
}

import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart';
import '../model/city.dart';
import '../model/province.dart';
import '../model/students.dart';

import '../config/app_url.dart';

class StudentSource {
  static Future<List<Student>> getAllStudent() async {
    String url = Api.province;
    try {
      Response response = await Client().get(Uri.parse(url));
      DMethod.printTitle('Student Source - Get All Province', response.body);
      Map responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Student.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Student Source - Get All Province', e.toString());
      return [];
    }
  }
}

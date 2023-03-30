import 'package:flutter/material.dart';
import '../model/students.dart';
import '../source/student_source.dart';

class CStudent extends ChangeNotifier {
  List<Student> _students = [];
  List<Student> get students => _students;
  setStudent() async {
    _students = await StudentSource.getAllStudent();
    notifyListeners();
  }
}

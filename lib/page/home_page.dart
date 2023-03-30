import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/config/app_route.dart';
import '../model/students.dart';
import '../controller/c_student.dart';
import '../widget/item_student.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cStudent = context.read<CStudent>();
    if (cStudent.students == null) DView.loadingCircle();
    context.read<CStudent>().setStudent();
    return Consumer<CStudent>(builder: (context, _, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Student List'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => context.push(AppRoute.addStudent),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
            ),
            Expanded(child: Consumer<CStudent>(
              builder: (contextConsumer, _, child) {
                if (_.students.isEmpty) {
                  return Column(
                    children: [
                      DView.empty(),
                      DView.empty('Or You are not Following anybody'),
                    ],
                  );
                }
                return ListView.builder(itemBuilder: (context, index) {
                  Student student = _.students[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      index == _.students.length - 1 ? 30 : 8,
                    ),
                    child: ItemStudent(
                      student: student,
                    ),
                  );
                });
              },
            ))
          ],
        ),
      );
    });
  }
}

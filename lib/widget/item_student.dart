import 'package:flutter/material.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/model/students.dart';

import '../config/app_url.dart';

class ItemStudent extends StatelessWidget {
  const ItemStudent({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(Api.upload),
        radius: 18,
      ),
      title: Text(
        student.name,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}

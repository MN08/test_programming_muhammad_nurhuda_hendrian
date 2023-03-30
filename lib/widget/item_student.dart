import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/model/students.dart';

import '../config/app_color.dart';

class ItemStudent extends StatelessWidget {
  const ItemStudent({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // context.push(AppRoute.profile, extra: topic.users);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      'img',
                      fit: BoxFit.cover,
                      height: 65,
                      width: 65,
                    ),
                  ),
                ),
                DView.spaceWidth(7),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student Name',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.fromLTRB(12, 6, 8, 6),
                    child: DView.textAction(
                      () {},
                      text: 'Detail',
                      size: 14,
                      color: Theme.of(context).primaryColor,
                      iconRight: Icons.navigate_next,
                      iconRightSize: 17,
                      iconRightColor: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

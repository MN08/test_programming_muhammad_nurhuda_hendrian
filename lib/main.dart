import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/model/students.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/repository.dart';

void main() {
  initializeDateFormatting('id_ID').then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Student App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Students> listStudent = [];
  Repository repository = Repository();

  getData() async {
    listStudent = await repository.getStudentData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Text(listStudent[index].name);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: listStudent.length),
    );
  }
}

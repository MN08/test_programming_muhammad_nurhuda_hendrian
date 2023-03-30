import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Siswa"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "masukan nama lengkap anda",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

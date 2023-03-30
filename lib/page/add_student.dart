import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.green : Colors.black,
        ),
      ),
    );
  }

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
                  hintText: "Masukan nama lengkap anda",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  CustomRadioButton("Male", 1),
                  SizedBox(
                    width: 10,
                  ),
                  CustomRadioButton("Female", 2),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1990), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownTextField(
                // initialValue: "name4",
                // controller: _cnt,
                clearOption: true,
                // enableSearch: true,
                // dropdownColor: Colors.green,
                searchDecoration: const InputDecoration(
                    hintText: "enter your custom hint text here"),
                validator: (value) {
                  if (value == null) {
                    return "Required field";
                  } else {
                    return null;
                  }
                },
                dropDownItemCount: 6,
                dropDownList: const [
                  DropDownValueModel(name: 'name1', value: "value1"),
                  DropDownValueModel(
                      name: 'name2',
                      value: "value2",
                      toolTipMsg:
                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'name3', value: "value3"),
                  DropDownValueModel(
                      name: 'name4',
                      value: "value4",
                      toolTipMsg:
                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'name5', value: "value5"),
                  DropDownValueModel(name: 'name6', value: "value6"),
                  DropDownValueModel(name: 'name7', value: "value7"),
                  DropDownValueModel(name: 'name8', value: "value8"),
                ],
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownTextField(
                // initialValue: "name4",
                // controller: _cnt,
                clearOption: true,
                // enableSearch: true,
                // dropdownColor: Colors.green,
                searchDecoration: const InputDecoration(
                    hintText: "enter your custom hint text here"),
                validator: (value) {
                  if (value == null) {
                    return "Required field";
                  } else {
                    return null;
                  }
                },
                dropDownItemCount: 6,
                dropDownList: const [
                  DropDownValueModel(name: 'name1', value: "value1"),
                  DropDownValueModel(
                      name: 'name2',
                      value: "value2",
                      toolTipMsg:
                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'name3', value: "value3"),
                  DropDownValueModel(
                      name: 'name4',
                      value: "value4",
                      toolTipMsg:
                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'name5', value: "value5"),
                  DropDownValueModel(name: 'name6', value: "value6"),
                  DropDownValueModel(name: 'name7', value: "value7"),
                  DropDownValueModel(name: 'name8', value: "value8"),
                ],
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

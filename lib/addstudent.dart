import 'package:flutter/material.dart';

class addStudent extends StatefulWidget {
  const addStudent({super.key});

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Student")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: emailcon,
              decoration: InputDecoration(
                label: Text("Name"),
                hintText: "Enter Your Name",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordcon,
              decoration: InputDecoration(
                label: Text("Roll-No"),
                hintText: "Enter Your Roll Number",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class updateStudent extends StatefulWidget {
  const updateStudent({super.key});

  @override
  State<updateStudent> createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Student")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
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
            ElevatedButton(onPressed: () {}, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}

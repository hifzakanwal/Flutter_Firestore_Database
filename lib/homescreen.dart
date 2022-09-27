import 'package:firestore/studentpage.dart';
import 'package:flutter/material.dart';

import 'addstudent.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("CRUD"),
            SizedBox(
              width: 350,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => addStudent())));
                },
                child: Text("Add"))
          ],
        ),
      ),
      body: studentPage(),
    );
  }
}

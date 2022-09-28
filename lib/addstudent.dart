import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class addStudent extends StatefulWidget {
  const addStudent({super.key});

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final namecon = TextEditingController();
  final rollnocon = TextEditingController();

  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Student")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: namecon,
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
              controller: rollnocon,
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
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    var name = namecon.text;
                    var rollNo = rollnocon.text;
                    adduser(name, rollNo);
                  });
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }

  Future<void> adduser(var name, rollNo) async {
    print("Added");
    CollectionReference user =
        FirebaseFirestore.instance.collection('students');
    String uId = DateTime.now().microsecondsSinceEpoch.toString();
    // String uId = '7575';
    // String name = 'hifza';
//default random id set in firestore: return user.add({'uId': uId, 'name': name})
//set id is 7575
    return await user
        .doc(uId)
        .set({'uId': uId, 'name': name, 'rollNo': rollNo})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => homescreen()))))
        .onError((error, stackTrace) => print("Error"));
  }
}

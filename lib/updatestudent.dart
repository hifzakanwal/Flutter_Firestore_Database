import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/homescreen.dart';
import 'package:flutter/material.dart';

class updateStudent extends StatefulWidget {
  final String id;

  const updateStudent({super.key, required this.id}); //

  @override
  State<updateStudent> createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  CollectionReference user = FirebaseFirestore.instance.collection('students');
  final Stream<QuerySnapshot> getdeta =
      FirebaseFirestore.instance.collection('students').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Student")),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: StreamBuilder<QuerySnapshot>(
              //get data by id
              stream: getdeta,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print("error");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> userData =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        return Column(
                          children: [
                            TextFormField(
                              initialValue: userData['name'],
                              onChanged: (value) {
                                userData['name'] = value;
                              },
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
                              onChanged: (value) {
                                userData['rollNo'] = value;
                              },
                              initialValue: userData['rollNo'],
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
                                onPressed: () {
                                  updateuser(widget.id, userData['name'],
                                      userData['rollNo']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homescreen()));
                                },
                                child: Text("Update"))
                          ],
                        );
                      });
                }
                ;
                return Text("data");
              })),
    );
  }

  Future<void> updateuser(id, var name, var rollNo) {
    // String name = "Kanwal";
    return user.doc(id).update({
      'name': name,
      'rollNo': rollNo,
    }); // when we store data by our id then use set method
  }
}

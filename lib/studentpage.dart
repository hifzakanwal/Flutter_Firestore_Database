import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/updatestudent.dart';
import 'package:flutter/material.dart';

class studentPage extends StatefulWidget {
  const studentPage({super.key});

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  CollectionReference user = FirebaseFirestore.instance.collection('students');
  final Stream<QuerySnapshot> getdeta =
      FirebaseFirestore.instance.collection('students').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: getdeta,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("error");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> userData = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Table(
                            border: TableBorder.all(),
                            columnWidths: const <int, TableColumnWidth>{
                              // 1: FixedColumnWidth(2),
                            }, //Width of second column is fixed

                            // defaultVerticalAlignment: TableCellVerticalAlignment.middle, //Text is in center

                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                  color: Color.fromARGB(255, 17, 100, 168),
                                  child: Center(
                                      child: Text(
                                    "Name",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )),
                                TableCell(
                                    child: Container(
                                  color: Color.fromARGB(255, 17, 100, 168),
                                  child: Center(
                                      child: Text("Id",
                                          style:
                                              TextStyle(color: Colors.white))),
                                )),
                                TableCell(
                                    child: Container(
                                  color: Color.fromARGB(255, 17, 100, 168),
                                  child: Center(
                                      child: Text("Action",
                                          style:
                                              TextStyle(color: Colors.white))),
                                )),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(child: Text(userData['name'])),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child:
                                      Center(child: Text(userData['rollNo'])),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 34),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        updateStudent()));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color:
                                                Color.fromARGB(255, 0, 107, 96),
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            deleteuser(userData['uId']);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ))
                              ]),
                            ],
                          ),
                        ),
                      );
                    });
              }
              ;
              return Text("data");
            }));
  }

  Future<void> deleteuser(String id) {
    return user
        .doc(id)
        .delete(); // when we store data by our id then use set method
  }
}

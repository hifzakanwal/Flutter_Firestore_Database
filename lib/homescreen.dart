import 'package:cloud_firestore/cloud_firestore.dart';
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
      // StreamBuilder<QuerySnapshot>(
      //     stream: getdeta,
      //     builder: (BuildContext context,
      //         AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError) {
      //         return Text("error");
      //       }

      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Text("waiting");
      //       }
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               Map<String, dynamic> userData =
      //                   snapshot.data!.docs[index].data()
      //                       as Map<String, dynamic>;
      //               return Text(userData['name']);
      //             });
      //       }
      //       ;
      //       return Text("data");
      //     })
    );
  }
}

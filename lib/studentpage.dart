import 'package:firestore/updatestudent.dart';
import 'package:flutter/material.dart';

class studentPage extends StatefulWidget {
  const studentPage({super.key});

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  color: Colors.black,
                  child: Center(
                      child: Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  )),
                )),
                TableCell(
                    child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Text("Roll-No",
                          style: TextStyle(color: Colors.white))),
                )),
                TableCell(
                    child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Text("Action",
                          style: TextStyle(color: Colors.white))),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(child: Text("Hifza")),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(child: Text("H-7289-A")),
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
                                    builder: (context) => updateStudent()));
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {},
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
      ),
    );
  }
}

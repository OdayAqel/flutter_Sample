// ignore_for_file: camel_case_types
import 'package:buss/databaseManager.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'icon_edit.dart';
import 'create_employee.dart';

class Employee {
  final String fullName;

  Employee({required this.fullName});
}

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => Edit_EmployeeState();
}

class Edit_EmployeeState extends State<Edit> {
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Employees').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF000080),
          leading: const SizedBox(),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ],
          title: const Text('الموظفين'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust the height as needed
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF90CAF9), // Top left color
                      Color(0xFF42A5F5), // Bottom right color
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, Index) {
                  return ListTile(
                    title: Text('Name'),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

 //لإحضار جميع بيانات ال Collection
    // FirebaseFirestore.instance.collection("Leader").get().then((value) => [
    //       value.docs.forEach((element) {
    //         print(element.data());
    //       })
    //     ]);
    //return Text("${Employees[i]['IdNumber']}");




    // Container(
    //       padding: const EdgeInsets.fromLTRB(7, 15, 7, 15),
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [
    //             Color(0xFF90CAF9), // Top left color
    //             Color(0xFF42A5F5), // Bottom right color
    //           ],
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //         ),
    //       ),
    //       child: ListView.builder(
    //           itemCount: EmpList.length,
    //           itemBuilder: (context, i) {
    //             return Card(
    //               child: ListTile(
    //                 title: Text(EmpList[i]['fullName']),
    //                 subtitle: Text(EmpList[i]['phone']),
    //                 trailing: Text('${EmpList[i]['hourscounter']}'),
    //               ),
    //             );
    //           })),
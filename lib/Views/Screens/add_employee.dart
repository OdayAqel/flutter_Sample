import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => AddNewEmployeeState();
}

class AddNewEmployeeState extends State<AddEmployee> {
  List Emps = [];

  Future getData() async {
    await FirebaseFirestore.instance
        .collection('Employees')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              Emps.add(document.reference);
            }));
  }

  late TextEditingController fullNameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneNumberController;
  late TextEditingController daysController;
  late TextEditingController monthController;
  late TextEditingController yearController;
  @override
  void initState() {
    fullNameController = TextEditingController();
    idNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
    daysController = TextEditingController();
    monthController = TextEditingController();
    yearController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    idNumberController.dispose();
    daysController.dispose();
    monthController.dispose();
    yearController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(8),
              ),
              controller: fullNameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Id Number',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(8),
              ),
              controller: idNumberController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(8),
              ),
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: daysController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Days',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: monthController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Month',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Year',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                //Aha
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

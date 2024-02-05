import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Absence extends StatefulWidget {
  const Absence({Key? key}) : super(key: key);

  @override
  State<Absence> createState() => _AbsenceState();
}

class _AbsenceState extends State<Absence> {
  String fullName = 'عدي ماجد عبد الرحمن عقل';
  bool isChecked = false;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime =
        const TimeOfDay(hour: 07, minute: 0); // Set default time to 5 PM
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absence'),
        backgroundColor: const Color(0xFF000080),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF000080),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) =>
                          const BorderSide(width: 1.0, color: Colors.white),
                    ),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        fullName,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isChecked)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF000080),
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Text(
                        DateFormat('hh:mm a').format(
                          DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            selectedTime.hour,
                            selectedTime.minute,
                          ),
                        ),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            const Spacer(), // Add spacer to push the button to the bottom
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  //Save action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000080),
                ),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

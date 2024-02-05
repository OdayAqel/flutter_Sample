import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/Auth_Widgets/auth_button.dart';
import '../Widgets/Auth_Widgets/auth_text_field.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  late TextEditingController fullName;
  late TextEditingController idNumber;
  late TextEditingController endDate;
  late TextEditingController hoursCost;
  late TextEditingController phoneNumber;

  @override
  void initState() {
    fullName = TextEditingController();
    idNumber = TextEditingController();
    endDate = TextEditingController();
    hoursCost = TextEditingController();
    phoneNumber = TextEditingController();
    super.initState();
  }

  // String? fullName;
  // String? idNumber;
  // String? endDate;
  // String? hoursCost;
  // String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ],
        title: const Text('إضافة موظف جديد'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            AuthTextField(
              labelText: "الإسم الكامل",
              icon: Icons.person_2_outlined,
              controller: fullName,
              textInputType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: Color(0xFFF0F2F0)), // Set the text color
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthTextField(
              labelText: "رقم الهوية",
              icon: Icons.numbers,
              controller: idNumber,
              textInputType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: Color(0xFFF0F2F0)), // Set the text color
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthTextField(
              labelText: "تاريخ إنتهاء التصريح",
              icon: Icons.date_range,
              controller: endDate,
              textInputType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: Color(0xFFF0F2F0)), // Set the text color
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthTextField(
              labelText: "أجار الساعة",
              icon: Icons.punch_clock,
              controller: hoursCost,
              textInputType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: Color(0xFFF0F2F0)), // Set the text color
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthTextField(
              labelText: "رقم الهاتف",
              icon: Icons.phone,
              controller: phoneNumber,
              textInputType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: Color(0xFFF0F2F0)), // Set the text color
            ),
            SizedBox(
              height: 60.h,
            ),
            AuthButton(
              onPressed: () {
                // Perform the action to add the new employee using the collected data
                // For example, you can print the values to the console
                print('Full Name: $fullName');
                print('ID Number: $idNumber');
                print('End Date: $endDate');
                print('Hours Cost: $hoursCost');
                print('Phone Number: $phoneNumber');
              },
              buttonName: 'Add Employee',
            ),
          ],
        ),
      ),
    );
  }
}

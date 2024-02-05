import 'package:buss/Views/Widgets/Auth_Widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class EmpSettings extends StatefulWidget {
  const EmpSettings({Key? key}) : super(key: key);

  @override
  State<EmpSettings> createState() => Employee_Settings();
}

class Employee_Settings extends State<EmpSettings> {
  late TextEditingController fullName;
  late TextEditingController idNum;
  late TextEditingController endDate;
  late TextEditingController hoursCost;
  late TextEditingController phoneNumber;

  @override
  void initState() {
    fullName = TextEditingController();
    idNum = TextEditingController();
    endDate = TextEditingController();
    hoursCost = TextEditingController();
    hoursCost = TextEditingController();
    phoneNumber = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ],
        title: const Text('الإعدادات'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF64B5F6), // Top color
              Color(0xFF2979FF), // Bottom color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      labelText: 'اسم الأب',
                      controller: endDate,
                      textInputType: TextInputType.name,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                  Expanded(
                    child: AuthTextField(
                      labelText: ' الإسم',
                      controller: endDate,
                      textInputType: TextInputType.name,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      labelText: 'اسم العائلة',
                      controller: endDate,
                      textInputType: TextInputType.name,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                  Expanded(
                    child: AuthTextField(
                      labelText: ' اسم الجد',
                      controller: endDate,
                      textInputType: TextInputType.name,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextField(
                labelText: 'id num',
                controller: idNum,
                textInputType: TextInputType.number,
                fillColor: const Color(0xFF1976D2),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      labelText: 'سنة',
                      controller: endDate,
                      textInputType: TextInputType.datetime,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                  Expanded(
                    child: AuthTextField(
                      labelText: 'شهر',
                      controller: endDate,
                      textInputType: TextInputType.datetime,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                  Expanded(
                    child: AuthTextField(
                      labelText: 'يوم',
                      controller: endDate,
                      textInputType: TextInputType.datetime,
                      fillColor: const Color(0xFF1976D2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextField(
                labelText: 'رقم الهاتف',
                controller: phoneNumber,
                textInputType: TextInputType.number,
                fillColor: const Color(0xFF1976D2),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextField(
                labelText: 'تكلفة الساعة ',
                controller: hoursCost,
                textInputType: TextInputType.number,
                fillColor: const Color(0xFF1976D2),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    ' تعديل',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('Employees');

  Future<void> createEmployeeData(
      String name, int idNUm, int hours, DateTime date, String phone) async {
    return await profileList.doc().set({
      'fullName': name,
      'IdNumber': idNUm,
      'date': date,
      'hours': hours,
      'phone': phone,
    });
  }

  Future getEmployeeList() async {
    List item = [];

    try {
      await profileList.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          item.add(element.data());
        });
      });
      return item;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

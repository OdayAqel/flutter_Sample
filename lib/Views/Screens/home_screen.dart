import 'package:buss/Views/Screens/absence.dart';
import 'package:buss/Views/Screens/attandance.dart';
import 'package:buss/Views/Screens/edit.dart';
import 'package:buss/Views/Screens/table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/custom_text.dart';
import 'package:buss/Views/Screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Leader = [];

  CollectionReference lead = FirebaseFirestore.instance.collection("Leaders");

  getData() async {
    var response = await lead.get();

    response.docs.forEach((element) {
      Leader.add(element.data());
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
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
            Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserScreen()),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    margin:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF000080),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              title: 'مرحبا يا ',
                              color: Colors.white,
                              fontSize: 27.sp,
                              isTitle: true,
                            ),
                            CustomText(
                              title: 'I don\'t know what\nshould I put here ',
                              color: Colors.white,
                              fontSize: 16.sp,
                              isTitle: true,
                            ),
                            // ListView.builder(
                            //     itemCount: Leader.length,
                            //     itemBuilder: (context, i) {
                            //       return Text(
                            //         "${Leader[i]['password']}",
                            //         style: const TextStyle(
                            //             fontSize: 14, color: Colors.white),
                            //       );
                            //     }),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                          radius: 52,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Absence()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          margin: const EdgeInsetsDirectional.only(
                            start: 16,
                            end: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000080),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/in.png'),
                                radius: 55,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomText(
                                title: 'دخول',
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Attendance()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          margin: const EdgeInsetsDirectional.only(
                            end: 16,
                            start: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000080),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/out.png'),
                                radius: 55,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    title: 'خروج',
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Edit()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          margin: const EdgeInsetsDirectional.only(
                            start: 16,
                            end: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000080),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/employee.png'),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomText(
                                title: 'الموظفين',
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShowTable()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          margin: const EdgeInsetsDirectional.only(
                            end: 16,
                            start: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000080),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/board.png'),
                              SizedBox(
                                height: 16.h,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    title: 'بيانات الشهر',
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

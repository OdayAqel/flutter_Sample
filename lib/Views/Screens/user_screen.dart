import 'package:buss/Views/Screens/Auth/new_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/warning_dialog.dart';
import '../Widgets/custom_list_tile.dart';
import '../Widgets/custom_text.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with WarningDialogHelper {
  late TextEditingController addressEditingController;
  @override
  void initState() {
    addressEditingController = TextEditingController(text: 'BitLid');
    super.initState();
  }

  @override
  void dispose() {
    addressEditingController.dispose();
    super.dispose();
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
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: 'Hi, ',
                            color: Colors.black,
                            fontSize: 27.sp,
                            isTitle: true,
                          ),
                          CustomText(
                            title: 'Oday',
                            color: const Color(0xFF1976D2),
                            fontSize: 25.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      CustomText(
                        title: 'oday@gmail.com',
                        color: const Color(0xFF304FFE),
                        fontSize: 18.sp,
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTile(
                        title: 'Address',
                        subtitle: 'My Address',
                        leading: IconlyLight.profile,
                        onPressed: () async {
                          await buildAddressDialog(context);
                        },
                      ),
                      CustomListTile(
                        title: 'Forgot Password',
                        leading: IconlyLight.unlock,
                        onPressed: () {
                          ///
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomListTile(
                        title: 'Logout',
                        leading: IconlyLight.logout,
                        onPressed: () {
                          showWarningDialog(
                            actionOK: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Login()));
                            },
                            context,
                            title: 'Sign out',
                            subtitle: 'Do you wanna sign out ?',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add your widget here
          ],
        ),
      ),
    );
  }

  Future<void> buildAddressDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update'),
        content: TextField(
          controller: addressEditingController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Your Address',
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                ///
              },
              child: const Text(
                'Update',
              )),
        ],
      ),
    );
  }
}






// body: Center(
//       child: SingleChildScrollView(
//         child: Padding(
          // padding: EdgeInsets.symmetric(
          //   horizontal: 10.w,
          //   vertical: 10.h,
          // ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const SizedBox(
          //       height: 36,
          //     ),
          //     Row(
          //       children: [
          //         CustomText(
          //           title: 'Hi, ',
          //           color: Colors.cyan,
          //           fontSize: 27.sp,
          //           isTitle: true,
          //         ),
          //         CustomText(
          //           title: 'Oday',
          //           color: Colors.black,
          //           fontSize: 25.sp,
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 6.h,
          //     ),
          //     CustomText(
          //       title: 'oday@gmail.com',
          //       color: Colors.grey,
          //       fontSize: 18.sp,
          //       isTitle: true,
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     const Divider(
          //       thickness: 2,
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     CustomListTile(
          //       title: 'Address',
          //       subtitle: 'My Address',
          //       leading: IconlyLight.profile,
          //       onPressed: () async {
          //         await buildAddressDialog(context);
          //       },
          //     ),
          //     CustomListTile(
          //       title: 'Forgot Password',
          //       leading: IconlyLight.unlock,
          //       onPressed: () {
          //         ///
          //       },
          //     ),
          //     SizedBox(
          //       height: 24.h,
          //     ),
          //     SizedBox(
          //       height: 16.h,
          //     ),
          //     CustomListTile(
          //       title: 'Logout',
          //       leading: IconlyLight.logout,
          //       onPressed: () {
          //         showWarningDialog(
          //           actionOK: () async {
          //             await FirebaseAuth.instance.signOut();
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => const Login()));
          //           },
          //           context,
          //           title: 'Sign out',
          //           subtitle: 'Do you wanna sign out ?',
          //         );
          //       },
          //     ),
          //   ],
          // ),
//         ),
//       ),
//     ));
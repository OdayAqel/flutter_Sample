import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buss/Views/Widgets/custom_text.dart';

mixin WarningDialogHelper {
  void showWarningDialog(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Function() actionOK,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Image.asset(
              'assets/images/warning-sign.png',
              height: 36.h,
              width: 36.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(title),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: CustomText(
                title: 'Cancel', fontSize: 18.sp, color: Colors.cyan),
          ),
          TextButton(
            onPressed: actionOK,
            child: CustomText(title: 'Ok', fontSize: 18.sp, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

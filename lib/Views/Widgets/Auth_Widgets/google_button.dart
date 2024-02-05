import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_text.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/google.png',
              width: 40.w,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          CustomText(
              title: 'Sign in with google',
              color: Colors.white,
              fontSize: 18.sp)
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.buttonName,
    this.isLoading = false,
    required this.onPressed,
    this.primary = Colors.blueAccent,
  }) : super(key: key);

  final String buttonName;
  final bool isLoading;
  final Function() onPressed;
  final Color primary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary, // background (button) color
          ),
          onPressed: onPressed,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : CustomText(
                  title: buttonName,
                  fontSize: 18.sp,
                  color: Colors.white,
                )),
    );
  }
}

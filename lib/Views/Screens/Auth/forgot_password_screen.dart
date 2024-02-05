import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buss/Helpers/snackbar.dart';
import 'package:buss/Views/Widgets/Auth_Widgets/auth_button.dart';
import 'package:buss/Views/Widgets/Auth_Widgets/auth_text_field.dart';
import 'package:buss/Views/Widgets/custom_text.dart';

import '../../../Helpers/warning_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SnackBarHelper, WarningDialogHelper {
  late TextEditingController emailEditingController;
  @override
  void initState() {
    emailEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomText(
                title: 'Forgot Password',
                fontSize: 30.sp,
                isTitle: true,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                labelText: 'Email',
                controller: emailEditingController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthButton(
                onPressed: () {
                  showWarningDialog(context,
                      title: 'Empty your history ?',
                      subtitle: 'Are you sure ?',
                      actionOK: () {});
                },
                buttonName: 'Reset now',
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

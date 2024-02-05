import 'package:buss/Views/Screens/Auth/new_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buss/Helpers/snackbar.dart';
import 'package:buss/Views/Widgets/custom_text.dart';
import '../../Widgets/Auth_Widgets/auth_button.dart';
import '../../Widgets/Auth_Widgets/auth_text_field.dart';
import 'forgot_password_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SnackBarHelper {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode passFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode addressFocusNode;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passFocusNode.dispose();
    emailFocusNode.dispose();
    addressFocusNode.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 100.h,
              ),
              CustomText(
                title: 'Welcome',
                fontSize: 30.sp,
                isTitle: true,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomText(
                title: 'Sign up to continue',
                fontSize: 18.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                labelText: 'Full Name',
                controller: fullNameController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 12.h,
              ),
              AuthTextField(
                labelText: 'Email',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 12.h,
              ),
              AuthTextField(
                labelText: 'Password',
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                obscure: true,
              ),
              SizedBox(
                height: 12.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forget password ?',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18.sp,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthButton(
                onPressed: () async {
                  var result = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                  if (result != null) {
                    FirebaseFirestore.instance.collection('Leaders').doc().set({
                      'fullName': fullNameController.text,
                      'email': emailController.text,
                      'password': passwordController.text,
                    });
                  }
                },
                buttonName: 'Sign up',
                isLoading: isLoading,
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Already a user ?',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    children: [
                      TextSpan(
                        text: '  Sign in',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> re() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context,
            message: 'The password provided is too weak.', error: false);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context,
            message: 'The account already exists for that email.',
            error: false);
      }
    } catch (e) {
      showSnackBar(context, message: e.toString(), error: true);
    }
  }
}

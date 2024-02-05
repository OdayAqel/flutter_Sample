import 'package:buss/Views/Screens/Auth/register_screen.dart';
import 'package:buss/Views/Screens/home_screen.dart';
import 'package:buss/Views/Widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:buss/Views/Widgets/Auth_Widgets/auth_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'forgot_password_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => MyLogin();
}

class MyLogin extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;
  late FocusNode passFocusNode;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF243B55),
                    Color(0xFF141E30),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    // Added Expanded widget
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 80, bottom: 20),
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/jaat.png'),
                            radius: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: const CustomText(
                                    title: "Login",
                                    fontSize: 24,
                                    color: Color(0xFFF0F2F0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: const CustomText(
                                    title: "Please fill all input below.",
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AuthTextField(
                                labelText: "Email",
                                icon: Icons.email,
                                controller: email,
                                textInputType: TextInputType.emailAddress,
                                style:
                                    const TextStyle(color: Color(0xFFFFFFFF)),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              AuthTextField(
                                labelText: 'Password',
                                icon: Icons.lock,
                                controller: password,
                                textInputType: TextInputType.visiblePassword,
                                obscure: true,
                                style: const TextStyle(
                                    color: Color(
                                        0xFFF0F2F0)), // Set the text color
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: const Color(0xFF77D4FC),
                                  ),
                                  child: const Text("Login"),
                                  onPressed: () async {
                                    await go();
                                  },
                                ),
                              ),
                              SizedBox(
                                child: TextButton(
                                  child: const Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                      color: Color(0xFF77D4FC),
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // Added Row widget
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          title: "Don't have an account?", fontSize: 18),
                      TextButton(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF77D4FC),
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> go() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('No user found for that email.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Wrong password provided for that user.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}

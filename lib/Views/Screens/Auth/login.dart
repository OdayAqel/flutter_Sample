import 'package:buss/Views/Screens/Auth/register_screen.dart';
import 'package:buss/Views/Screens/home_screen.dart';
import 'package:buss/Views/Widgets/Auth_Widgets/auth_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_password_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => MyLogin();
}

class MyLogin extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode passFocusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context)
                  .size
                  .height, // Adjust the height as needed
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: const Text(
                      "أهلا وسهلاً",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        'assets/images/jaat.png', // Replace with your image path
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  AuthTextField(
                    labelText: 'البريد الإلكتروني',
                    controller: emailController,
                    //obscure: false,
                    icon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  AuthTextField(
                    labelText: 'كلمة المرور',
                    controller: passwordController,
                    obscure: true,
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(color: Color(0xFF304FFE)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString(
                            'email', emailController.text);
                        await go();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF000080),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              'email', emailController.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "أنشئ حساب",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF304FFE)),
                        ),
                      ),
                      const Text(
                        "مستخدم جديد؟ ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF000000)),
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
        email: emailController.text,
        password: passwordController.text,
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
































// FocusScope.of(context).unfocus();
//                         String id = emailController.text.trim();
//                         String password = passwordController.text.trim();
//                         QuerySnapshot snap = await FirebaseFirestore.instance
//                             .collection("Leaders")
//                             .where('email', isEqualTo: id)
//                             .get();

//                         if (id.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text("اكتب  البريد الإلكتروني")));
//                         } else if (password.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("اكتب كلمة سر")));
//                         } else {
//                           QuerySnapshot snap = await FirebaseFirestore.instance
//                               .collection("Leaders")
//                               .where('email', isEqualTo: emailController)
//                               .get();

//                           try {
//                             if (password == snap.docs[0]['password']) {
//                               print('continue');
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text("كلمة المرور غير صحيحة")));
//                             }
//                           } catch (e) {
//                             String Error = " ";
//                             print(e.toString());
//                             print('----==================----');

//                             if (e.toString() == "") {}
//                           }
//                         }
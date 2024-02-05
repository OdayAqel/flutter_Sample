import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (context) =>  const BottomBarScreen()
      //
      // ));
    });
  }

  Future<void> init() async {
    await navigate();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}

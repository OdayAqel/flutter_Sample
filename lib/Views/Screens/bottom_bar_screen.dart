// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:buss/Views/Screens/user_screen.dart';
// import 'home_screen.dart';

// class BottomBarScreen extends StatefulWidget {
//   const BottomBarScreen({Key? key}) : super(key: key);

//   @override
//   State<BottomBarScreen> createState() => _BottomBarScreenState();
// }

// class _BottomBarScreenState extends State<BottomBarScreen> {
//   final List<Map<String, dynamic>> _pages = [
//     {'page': const HomeScreen(), 'title': 'Home Screen'},
//     {'page': const UserScreen(), 'title': 'UserS Screen'},
//   ];
//   int _selectedIndex = 0;
//   void _selectedPage(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex]['page'],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _selectedPage,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(
//                   _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                   _selectedIndex == 1 ? IconlyBold.user3 : IconlyLight.user3),
//               label: 'User'),
//         ],
//       ),
//     );
//   }
// }

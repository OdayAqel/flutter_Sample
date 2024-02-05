import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final IconData trailing;
  final Function() onPressed;
  const CustomListTile({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.leading,
    this.trailing = IconlyLight.arrowRight2,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(leading),
      title: CustomText(
        isTitle: true,
        title: title,
        fontSize: 22.sp,
      ),
      subtitle: Text(subtitle),
      trailing: Icon(trailing),
    );
  }
}

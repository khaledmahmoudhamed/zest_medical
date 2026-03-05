import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditIconWidget extends StatelessWidget {
  const EditIconWidget({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16.sp,
        backgroundColor: Colors.cyan[50],
        child: Icon(Icons.edit, size: 14.sp, color: const Color(0xff247CFF)),
      ),
    );
  }
}

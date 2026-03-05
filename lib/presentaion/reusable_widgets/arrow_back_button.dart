import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArrowBackIos extends StatelessWidget {
  const ArrowBackIos({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );
  }
}

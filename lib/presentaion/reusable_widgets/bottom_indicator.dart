import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 0.7.h,
        ), // Adds breathing room above the indicator
        child: SizedBox(
          height: 0.5.h,
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 0.1.h, color: Colors.black54),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text("or sign in with", style: TextStyle(fontSize: 18.sp)),
          ),
          Expanded(
            child: Divider(thickness: 0.1.h, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

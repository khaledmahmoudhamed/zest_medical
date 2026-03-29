import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/app_router.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.star, color: Color(0xffFFD600)),
        Row(
          children: [
            Text("4.8", style: TextStyle(fontSize: 17.sp)),
            SizedBox(width: 1.w),
            Text(
              overflow: TextOverflow.ellipsis,
              "(4.279 reviews)",
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
      ],
    );
  }
}

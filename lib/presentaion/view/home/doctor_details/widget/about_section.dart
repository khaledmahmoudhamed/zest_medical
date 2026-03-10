import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.phone,
    required this.price,
  });

  final String description;
  final String startTime;
  final String endTime;
  final String phone;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About me",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(height: 0.5.h),
            Text(description, style: TextStyle(fontSize: 15.sp)),
            SizedBox(height: 2.h),
            Text(
              "Working Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "From $startTime",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                  TextSpan(
                    text: "→",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: endTime,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(height: 0.5.h),
            Text(phone, style: TextStyle(fontSize: 15.sp)),
            SizedBox(height: 2.h),
            Text(
              "Appointment Price",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(height: 0.5.h),
            Text("\$$price", style: TextStyle(fontSize: 15.sp)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../home/widget/rating_section.dart';

class ReusedDoctorCard extends StatelessWidget {
  const ReusedDoctorCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.isChatRequired,
  });
  final String name;
  final String specialization;
  final bool isChatRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Color(0xffE0D1D6),
                ),
                child: Image.asset(
                  "assets/diseases/doctor.png",
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    specialization,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 2.h),
                  RatingSection(),
                ],
              ),
            ],
          ),
          isChatRequired
              ? Positioned(
                  top: -1.h,
                  right: 1.w,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message_outlined, color: Colors.blue),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

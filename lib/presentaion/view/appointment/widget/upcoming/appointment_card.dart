import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/rating_section.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.appointmentTime,
    required this.isRating,
  });
  final String doctorName;
  final String doctorSpecialization;
  final String? appointmentTime;
  final bool isRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/diseases/doctor.png",
            fit: BoxFit.fitHeight,
            alignment: Alignment.topLeft,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  doctorName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  overflow: TextOverflow.ellipsis,
                  doctorSpecialization,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 1.h),

                !isRating
                    ? Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          appointmentTime!,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      )
                    : RatingSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/upcoming/appointment_card.dart';

import 'button_section.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({
    super.key,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.appointmentTime,
    this.cancelOnTap,
    this.rescheduleOnTap,
  });
  final String doctorName;
  final String doctorSpecialization;
  final String appointmentTime;
  final void Function()? cancelOnTap;
  final void Function()? rescheduleOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.grey[50],
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Colors.grey,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          SizedBox(height: 1.h),
          AppointmentCard(
            doctorName: doctorName,
            doctorSpecialization: doctorSpecialization,
            appointmentTime: appointmentTime,
            isRating: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Divider(),
          ),
          SizedBox(height: 1.h),
          ButtonsSection(
            cancelOnTap: cancelOnTap,
            rescheduleOnTap: rescheduleOnTap,
          ),
        ],
      ),
    );
  }
}

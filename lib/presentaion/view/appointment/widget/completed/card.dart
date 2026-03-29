import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/upcoming/appointment_card.dart';

class CardSection extends StatelessWidget {
  const CardSection({
    super.key,
    required this.date,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.text,
    required this.color,
  });
  final String date;
  final String doctorName;
  final String doctorSpecialization;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
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
          ListTile(
            title: Text(text, style: TextStyle(color: color)),
            subtitle: Text(date),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Divider(),
          ),
          AppointmentCard(
            doctorName: doctorName,
            doctorSpecialization: doctorSpecialization,
            appointmentTime: '',
            isRating: true,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../cache/hive.dart';
import '../../../../../../core/constants/app_constants_keys.dart';

class BookingTypeWidget extends StatelessWidget {
  BookingTypeWidget({super.key});
  final appointmentType = CacheHelper.user!.get(ApiKeys.userBookingType);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Color(0xffE9FAEF),
        ),
        child: Icon(
          appointmentType == "In Person"
              ? Icons.person
              : appointmentType == "Video Call"
              ? Icons.video_camera_back_outlined
              : Icons.phone,
          color: Colors.green,
        ),
      ),
      title: Text(
        "Appointment Type",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      subtitle: Text(appointmentType ?? '', style: TextStyle(fontSize: 16.sp)),
    );
  }
}

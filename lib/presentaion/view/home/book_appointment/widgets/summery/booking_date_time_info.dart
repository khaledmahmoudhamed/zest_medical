import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../cache/hive.dart';
import '../../../../../../core/constants/app_constants_keys.dart';

class BookingDateTimeInfo extends StatelessWidget {
  BookingDateTimeInfo({super.key});
  final day = CacheHelper.user!.get(ApiKeys.userBookingDay);
  final time = CacheHelper.user!.get(ApiKeys.userBookingDate);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Color(0xffEAF2FF),
        ),
        child: Icon(Icons.date_range, color: Colors.blue),
      ),
      title: Text(
        "Date&Time",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),

      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day ?? '', style: TextStyle(fontSize: 16.sp)),
          Text(time ?? '', style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}

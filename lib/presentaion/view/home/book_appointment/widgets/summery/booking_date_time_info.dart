import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../cache/hive.dart';
import '../../../../../../core/constants/app_constants_keys.dart';

class BookingDateTimeInfo extends StatelessWidget {
  const BookingDateTimeInfo({super.key, required this.day});

  final String day;

  String getFormattedDate(String day) {
    DateTime date = day.isEmpty ? DateTime.now() : DateTime.parse(day);
    return DateFormat('EEEE, MMMM dd, yyyy').format(date);
  }

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
          Text(
            day.isEmpty ? getFormattedDate(day) : day,
            style: TextStyle(fontSize: 16.sp),
          ),
          // Text(time ?? '', style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key, required this.practicePlace});
  final String practicePlace;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(left: 3.w, top: 3.h, right: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Practice Place",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              SizedBox(height: 0.5.h),
              Text(practicePlace, style: TextStyle(fontSize: 15.sp)),
              SizedBox(height: 2.h),
              Text(
                "Location Map",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

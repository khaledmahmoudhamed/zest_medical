import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';

class NurseCardSection extends StatelessWidget {
  const NurseCardSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          width: double.infinity,
          height: 22.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: Color(0xff237BFF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Book and\nschedule with\nnearest doctor",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              ReusableButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.findNearbyScreen);
                },
                containerColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: Text(
                  "Find Nearby",
                  style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: -5.h,
          child: Image.asset('assets/Image.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}

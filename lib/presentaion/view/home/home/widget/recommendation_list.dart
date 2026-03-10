import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/rating_section.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../data/models/home_model/doctor_info.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key, required this.doctors, this.onTap});
  final List<Doctors> doctors;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.doctorDetailsScreen,
              arguments: doctors[index],
            );
          },
          child: Container(
            height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey,
                  spreadRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
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
                        doctors[index].name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        doctors[index].specialization.name,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 1.h),
                      RatingSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';
import 'package:zest_medical/presentaion/view/home/recomendation_doctor/widgets/city_bottom_sheet_section.dart';
import 'package:zest_medical/presentaion/view/home/recomendation_doctor/widgets/speciality_bottom_sheet_section.dart';

class BottomSheetClass {
  static void showBottomSheet(BuildContext context, List<Doctors> doctors) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      context: context,
      builder: (context) {
        return BlocBuilder<DoctorCubit, DoctorState>(
          builder: (BuildContext context, DoctorState state) {
            return Container(
              height: 50.h,
              padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sort By",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Divider(
                    height: 0.2.h,
                    color: Colors.grey,
                    radius: BorderRadius.circular(20.sp),
                    thickness: 0.3.h,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Speciality",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 1.h),
                  SpecialityBottomSheetSection(doctors: doctors),
                  SizedBox(height: 3.h),
                  Text(
                    "City",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  CityBottomSheetSection(doctors: doctors),
                  SizedBox(height: 4.h),
                  ReusableButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    alignment: Alignment.center,
                    containerColor: Color(0xff247CFF),
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

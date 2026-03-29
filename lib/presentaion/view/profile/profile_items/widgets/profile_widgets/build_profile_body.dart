import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/presentaion/view/profile/profile_items/widgets/profile_widgets/profile_items.dart';

import '../../../../../reusable_widgets/reusabel_button.dart';

class BuildProfileBody extends StatelessWidget {
  const BuildProfileBody({
    super.key,
    required this.name,
    required this.email,
    this.userData,
  });

  final String name;
  final String email;
  final dynamic userData;
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _miniButton("My Appointment", () {
          if (userData is Doctors && userData != null) {
            Navigator.pushNamed(
              context,
              AppRouter.appointments,
              arguments: userData,
            );
          } else {
            ShowMessageHandler.showSnackBar(
              context,
              message: "No appointment data available",
              isError: true,
            );
          }
        }),
        SizedBox(width: 3.w),
        _miniButton("Medical Records", () {
          Navigator.pushNamed(context, AppRouter.medicalRecords);
        }),
      ],
    );
  }

  Widget _miniButton(String text, void Function()? onTap) {
    return ReusableButton(
      onTap: onTap,

      containerColor: Colors.grey[100],
      radius: 12.sp,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22.h),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 78.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.sp)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w, bottom: 2.h),
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 3.h),
            _buildActionButtons(context),
            SizedBox(height: 3.h),
            ProfileItems(),
          ],
        ),
      ),
    );
  }
}

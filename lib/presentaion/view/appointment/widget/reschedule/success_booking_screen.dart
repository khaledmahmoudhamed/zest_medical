import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';

import '../../../../../cache/hive.dart';
import '../../../../../core/constants/app_constants_keys.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../data/models/home_model/doctor_info.dart';
import '../../../../../logic/patient_cubit/patient_cubit.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/reusabel_button.dart';
import '../../../home/book_appointment/widgets/summery/main_summery_widget.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({
    super.key,
    required this.doctors,
    required this.dateTime,
    this.title = "Booking has been rescheduled",
  });
  final Doctors doctors;
  final String dateTime;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSizedWidget(text: "Details"),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReusableButton(
            onTap: () {
              context.read<PatientCubit>().postAppointment(
                id: doctors.id,
                startTime: dateTime,
              );
              ShowMessageHandler.showSnackBar(
                context,
                message: "$title Successfully",
              );
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.canPop(context);
              Navigator.canPop(context);
            },
            alignment: Alignment.center,
            containerColor: AppColors.blueColor,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            margin: EdgeInsets.only(
              left: 4.w,
              bottom: 2.h,
              right: 4.w,
              top: .5.h,
            ),
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomIndicator(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 3.w, right: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset("assets/success.svg")),
            SizedBox(height: 2.h),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(height: 4.h),
            SummeryStepperWidget(
              doctors: doctors,
              onTap: () {},
              isPaymentRequired: false,
              day: dateTime,
            ),
          ],
        ),
      ),
    );
  }
}

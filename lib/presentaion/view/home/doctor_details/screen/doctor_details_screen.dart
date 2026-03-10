import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/constants/colors.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';

import '../../../../../data/models/home_model/doctor_info.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widget/default_tab_bar_controller.dart';
import '../widget/header_card.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorDetailsScreen({super.key, required this.doctors});
  final Doctors doctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReusableButton(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.appointments,
                arguments: doctors,
              );
            },
            alignment: Alignment.center,
            containerColor: AppColors.blueColor,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Text(
              "Make An Appointment",
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
      appBar: PreferredSizedWidget(
        text: doctors.name,
        isActionRequired: true,
        actionIcon: SvgPicture.asset('assets/three_dots.svg', width: 6.w),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderCard(
              name: doctors.name,
              specialization:
                  "${doctors.specialization.name} | ${doctors.degree}",
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: DefaultTabBarControllerWidget(
                description:
                    "Dr.${doctors.name} (${doctors.description}) is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
                startTime: doctors.startTime,
                endTime: doctors.endTime,
                phone: doctors.phone,
                price: doctors.appointPrice,
                practicePlace: doctors.address,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

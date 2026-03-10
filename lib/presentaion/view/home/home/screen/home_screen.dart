import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/reusable_text.dart';
import '../widget/nurse_card.dart';
import '../widget/header_section.dart';
import '../widget/home_doctor_card.dart';
import '../widget/specializations_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              SizedBox(height: 4.h),
              NurseCardSection(),
              SizedBox(height: 2.h),
              ReusableText(
                text1: "Doctor Speciality",
                text2: "See All",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.doctorSpecialityScreen,
                  );
                },
              ),
              SpecializationsWidget(),
              ReusableText(
                text1: "Recommendation Doctor",
                text2: "See All",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.recommendationDoctorScreen,
                  );
                },
              ),
              DoctorCardSection(),
            ],
          ),
        ),
      ),
    );
  }
}

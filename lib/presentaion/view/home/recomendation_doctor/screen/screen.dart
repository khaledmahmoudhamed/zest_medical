import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/presentaion/view/home/recomendation_doctor/widgets/rec_doctor_card.dart';
import '../../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../../../../logic/doctor_cubit/doctor_state.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/search_sections.dart';

class RecommendationDoctorScreen extends StatefulWidget {
  const RecommendationDoctorScreen({super.key});

  @override
  State<RecommendationDoctorScreen> createState() =>
      _RecommendationDoctorScreenState();
}

class _RecommendationDoctorScreenState
    extends State<RecommendationDoctorScreen> {
  @override
  void initState() {
    context.read<DoctorCubit>().getAllDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(
        text: "Recommendation Doctor",
        isActionRequired: true,
        actionIcon: SvgPicture.asset('assets/three_dots.svg', width: 6.w),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 3.h, left: 2.w, right: 2.w),
        child: Column(
          children: [
            SearchSections(
              onChanged: (val) {
                context.read<DoctorCubit>().searchDoctors(val);
              },
              onPressed: () {
                final currentState = context.read<DoctorCubit>().state;
                BottomSheetClass.showBottomSheet(
                  context,
                  currentState.allDoctorsList,
                );
              },
            ),
            SizedBox(height: 4.h),
            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (BuildContext context, DoctorState state) {
                if (state.recommendedDoctorStatus == DoctorStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.recommendedDoctorStatus ==
                    DoctorStatus.loaded) {
                  return RecoDoctorCard(
                    length: state.displayedDoctorsList.length,
                    doctors: state.displayedDoctorsList,
                  );
                } else if (state.recommendedDoctorStatus ==
                        DoctorStatus.failed ||
                    state.filterDoctorStatus == DoctorStatus.failed) {
                  return Center(child: Text(state.error!));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/recommendation_list.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../profile/profile_items/widgets/profile_widgets/build_error_widget.dart';

class DoctorCardSection extends StatefulWidget {
  const DoctorCardSection({super.key});

  @override
  State<DoctorCardSection> createState() => _DoctorCardSectionState();
}

class _DoctorCardSectionState extends State<DoctorCardSection> {
  @override
  void initState() {
    context.read<DoctorCubit>().homeRecommendedDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (BuildContext context, state) {
        if (state.homeStatus == DoctorStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.homeStatus == DoctorStatus.loaded) {
          return RecommendationList(
            doctors: state.homeRecommendedDoctorsList,
            length: state.homeRecommendedDoctorsList.length,
          );
        } else if (state.homeStatus == DoctorStatus.failed) {
          return BuildErrorWidget(
            error: state.error!,
            onPressed: () {
              context.read<DoctorCubit>().homeRecommendedDoctors();
            },
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

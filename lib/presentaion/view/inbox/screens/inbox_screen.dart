import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import '../../../../core/constants/colors.dart';
import '../../../../data/models/home_model/doctor_info.dart';
import '../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../home/recomendation_doctor/widgets/bottom_sheet.dart';
import '../../home/recomendation_doctor/widgets/search&icon_row.dart';
import '../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/chat_doctor_card.dart';
import '../widgets/create_new_message.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final controller = TextEditingController();
  @override
  void initState() {
    context.read<DoctorCubit>().getAllDoctors();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSizedWidget(
        text: "Message",
        isActionRequired: true,
        actionIcon: CreateNewMessage(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 3.h, left: 2.w, right: 2.w),
        child: Column(
          children: [
            SearchAndIconRow(
              controller: controller,
              onChanged: (val) {
                context.read<DoctorCubit>().searchDoctors(val);
              },
              onFieldSubmitted: (val) {},

              widget: IconButton(
                onPressed: () {
                  final currentState = context.read<DoctorCubit>().state;

                  BottomSheetClass.showBottomSheet(
                    context,
                    currentState.allDoctorsList,
                  );
                },
                icon: Icon(Icons.filter_list_sharp, size: 25.sp),
              ),
            ),
            SizedBox(height: 2.h),
            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (BuildContext context, state) {
                if (state.recommendedDoctorStatus == DoctorStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.recommendedDoctorStatus == DoctorStatus.loading &&
                    state.allDoctorsList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.recommendedDoctorStatus ==
                    DoctorStatus.loaded) {
                  return ChatDoctorCard(
                    doctors: state.displayedRecommendedDoctorsList,
                    length: state.displayedRecommendedDoctorsList.length,
                  );
                } else if (state.recommendedDoctorStatus ==
                    DoctorStatus.failed) {
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

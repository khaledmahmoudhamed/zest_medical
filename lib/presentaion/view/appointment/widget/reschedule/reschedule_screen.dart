import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import '../../../../../core/constants/app_constants_keys.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../../logic/patient_cubit/patient_cubit.dart';
import '../../../../../logic/patient_cubit/patient_state.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/reusabel_button.dart';
import '../../../home/book_appointment/widgets/date&time/main_date_time_widget.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';

class RescheduleScreen extends StatelessWidget {
  RescheduleScreen({super.key, required this.doctors});
  final Doctors doctors;
  String dateTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSizedWidget(text: "Reschedule"),
      bottomNavigationBar: BlocListener<PatientCubit, PatientState>(
        listener: (BuildContext context, PatientState state) {
          if (state.patientStatus == PatientStatus.loading) {
            Center(child: CircularProgressIndicator());
          }
          if (state.patientStatus == PatientStatus.success) {
            Center(child: CircularProgressIndicator());
          }
          if (state.patientStatus == PatientStatus.error) {
            ShowMessageHandler.showSnackBar(
              context,
              message: state.errorMessage!,
              isError: true,
            );
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReusableButton(
              onTap: () async {
                Navigator.pushNamed(
                  context,
                  AppRouter.successBookingScreen,
                  arguments: {
                    'doctor': doctors,
                    'title': "Booking has been rescheduled",
                    'dateTime': dateTime,
                  },
                );
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
                "Reschedule",
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: DateTimeStepperWidget(
          onDateChange: (DateTime selectedTime) {
            String dayName = DateFormat('EEE').format(selectedTime);
            String dayNumber = DateFormat('dd').format(selectedTime);
            String monthYear = DateFormat('MMM yyy').format(selectedTime);
            String fullDate = "$dayName, $dayNumber $monthYear";
            dateTime = fullDate;
          },
        ),
      ),
    );
  }
}

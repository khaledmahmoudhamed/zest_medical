import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/logic/patient_cubit/patient_cubit.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/reschedule/success_booking_screen.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/reusabel_button.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/date&time/main_date_time_widget.dart';
import '../widgets/payment/payment_widget.dart';
import '../widgets/stipper_widget.dart';
import '../widgets/summery/main_summery_widget.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key, this.doctors});

  final Doctors? doctors;
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int currentStep = 0;
  String dateTime = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BlocListener<PatientCubit, PatientState>(
        listener: (BuildContext context, PatientState state) {
          if (state.patientStatus == PatientStatus.loading) {
            Center(child: CircularProgressIndicator());
          }
          if (state.patientStatus == PatientStatus.success) {}
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
              onTap: () {
                setState(() {
                  if (currentStep < 2) {
                    currentStep++;
                  } else {
                    Navigator.pushNamed(
                      context,
                      AppRouter.successBookingScreen,
                      arguments: {
                        "doctor": widget.doctors,
                        "dateTime": dateTime,
                        'title': "Booking Confirmed",
                      },
                    );
                  }
                });
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
                currentStep != 2 ? "Continue" : "Book Now",
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
      appBar: PreferredSizedWidget(text: "My Appointments"),
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperWidget(activeStep: currentStep),
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: [
                  DateTimeStepperWidget(
                    onDateChange: (DateTime selectedDate) {
                      String dayName = DateFormat('EEE').format(selectedDate);
                      String dayNumber = DateFormat('dd').format(selectedDate);
                      String monthYear = DateFormat(
                        'MMM yyy',
                      ).format(selectedDate);
                      String fullDate = "$dayName, $dayNumber $monthYear";
                      dateTime = fullDate;
                    },
                  ),
                  PaymentStepperWidget(),
                  SummeryStepperWidget(
                    doctors: widget.doctors!,
                    onTap: () {
                      setState(() {
                        currentStep = 1;
                      });
                    },
                    day: dateTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

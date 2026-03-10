import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/reusabel_button.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/date&time/main_date_time_widget.dart';
import '../widgets/payment/payment_widget.dart';
import '../widgets/stipper_widget.dart';
import '../widgets/summery/main_summery_widget.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key, required this.doctors});

  final Doctors doctors;
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReusableButton(
            onTap: () {
              setState(() {
                if (currentStep < 2) {
                  currentStep++;
                } else {
                  ShowMessageHandler.showSuccessDialog(
                    context: context,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    title: "Booking Confirmed",
                    subTitle: "Booking An Appointment Completed Successfully",
                    close: "Done",
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
                  DateTimeStepperWidget(),
                  PaymentStepperWidget(),
                  SummeryStepperWidget(
                    doctors: widget.doctors,
                    onTap: () {
                      setState(() {
                        currentStep = 1;
                      });
                    },
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

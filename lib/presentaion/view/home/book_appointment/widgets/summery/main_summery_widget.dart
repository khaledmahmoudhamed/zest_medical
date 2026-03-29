import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/book_appointment/widgets/summery/doctor_info_section.dart';
import '../../../../../../data/models/home_model/doctor_info.dart';
import 'booking_date_time_info.dart';
import 'booking_type.dart';

class SummeryStepperWidget extends StatelessWidget {
  const SummeryStepperWidget({
    super.key,
    required this.doctors,
    required this.onTap,
    this.isPaymentRequired = true,
    required this.day,
  });
  final Doctors doctors;
  final void Function()? onTap;
  final bool isPaymentRequired;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Booking Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        BookingDateTimeInfo(day: day),
        SizedBox(height: 1.h, child: Divider()),
        SizedBox(height: 1.h),
        BookingTypeWidget(),
        SizedBox(height: 1.h, child: Divider()),
        SizedBox(height: 2.h),
        Text(
          "Doctor Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(height: 1.h),
        DoctorInfoSection(
          doctors: doctors,
          onTap: onTap,
          isPaymentRequired: isPaymentRequired,
        ),
      ],
    );
  }
}

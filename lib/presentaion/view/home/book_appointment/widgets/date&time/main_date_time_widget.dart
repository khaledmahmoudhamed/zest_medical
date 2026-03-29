import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/book_appointment/widgets/date&time/select_date_widget.dart';
import 'appointment_type_widget.dart';
import 'available_time_widget.dart';

class DateTimeStepperWidget extends StatefulWidget {
  const DateTimeStepperWidget({super.key, required this.onDateChange});
  final void Function(DateTime)? onDateChange;
  @override
  State<DateTimeStepperWidget> createState() => _DateTimeStepperWidgetState();
}

class _DateTimeStepperWidgetState extends State<DateTimeStepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Date",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SelectDateWidget(onDateChange: widget.onDateChange),
        SizedBox(height: 2.h),
        Text(
          "Available Time",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(height: 1.h),
        AvailableTimeWidget(),
        SizedBox(height: 2.h),
        Text(
          "Appointment Type",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(height: 1.h),
        AppointmentTypeWidget(),
      ],
    );
  }
}

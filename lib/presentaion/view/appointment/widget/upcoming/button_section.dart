import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../reusable_widgets/reusabel_button.dart';

class ButtonsSection extends StatefulWidget {
  const ButtonsSection({super.key, this.cancelOnTap, this.rescheduleOnTap});
  final void Function()? cancelOnTap;
  final void Function()? rescheduleOnTap;
  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ReusableButton(
            alignment: Alignment.center,
            containerColor: AppColors.blueColor,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            onTap: widget.cancelOnTap,
            child: Text(
              "Cancel Appointment",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ReusableButton(
            alignment: Alignment.center,
            onTap: widget.rescheduleOnTap,
            containerColor: AppColors.blueColor,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Text("Reschedule", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

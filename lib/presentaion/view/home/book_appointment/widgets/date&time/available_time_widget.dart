import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../reusable_widgets/reusabel_button.dart';

class AvailableTimeWidget extends StatefulWidget {
  const AvailableTimeWidget({super.key});

  @override
  State<AvailableTimeWidget> createState() => _AvailableTimeWidgetState();
}

class _AvailableTimeWidgetState extends State<AvailableTimeWidget> {
  final List<String> availableTimes = [
    "08:00 AM",
    "08:30 AM",
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
  ];

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: availableTimes.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return ReusableButton(
          alignment: Alignment.center,
          containerColor: isSelected ? AppColors.blueColor : Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.7.h),
          margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),

          onTap: () async {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Text(
            availableTimes[index],
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        );
      },
    );
  }
}

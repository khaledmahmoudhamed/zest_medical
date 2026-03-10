import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

import '../../../../../../core/constants/colors.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) async {
        String dayName = DateFormat('EEE').format(selectedDate);
        String dayNumber = DateFormat('dd').format(selectedDate);
        String monthYear = DateFormat('MMM yyy').format(selectedDate);
        String fullDate = "$dayName, $dayNumber $monthYear";
        await CacheHelper.user!.put(ApiKeys.userBookingDay, fullDate);
      },
      activeColor: AppColors.blueColor,
      dayProps: EasyDayProps(
        height: 7.h,
        width: 12.w,
        dayStructure: DayStructure.dayStrDayNum, // Matches "Mon 10" style
      ),
    );
  }
}

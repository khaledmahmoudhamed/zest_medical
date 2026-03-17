import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/logic/patient_cubit/patient_cubit.dart';

import '../../../../../../core/constants/colors.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key, required this.onDateChange});
  final void Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: onDateChange,
      activeColor: AppColors.blueColor,
      dayProps: EasyDayProps(
        height: 7.h,
        width: 12.w,
        dayStructure: DayStructure.dayStrDayNum, // Matches "Mon 10" style
      ),
    );
  }
}

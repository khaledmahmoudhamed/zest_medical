import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';

import '../../../../../data/models/home_model/doctor_info.dart';

class SpecialityBottomSheetSection extends StatelessWidget {
  const SpecialityBottomSheetSection({super.key, required this.doctors});
  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (BuildContext context, state) {
          final Map<int, String> uniqueSpec = {};
          for (var doc in state.allDoctorsList) {
            uniqueSpec[doc.specialization.id] = doc.specialization.name;
          }
          final specIds = uniqueSpec.keys.toList();
          final specNames = uniqueSpec.values.toList();
          return ListView.builder(
            itemCount: specIds.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final currentId = specIds[index];
              final currentName = specNames[index];
              bool isChecked = state.checkedSpecialityId == currentId;
              return InkWell(
                onTap: () {
                  int? newId = isChecked ? null : currentId;
                  context.read<DoctorCubit>().filterDoctorsBySpeciality(newId);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: !isChecked ? Colors.grey[50] : Color(0xff247CFF),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    currentName,
                    style: TextStyle(
                      color: !isChecked ? Colors.black87 : Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/recommendation_list.dart';

import '../../../../data/models/home_model/doctor_info.dart';

class SearchBySpecializationsWidget extends StatelessWidget {
  const SearchBySpecializationsWidget({super.key, required this.doctors});
  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (BuildContext context, state) {
        final uniqueSpecialization = doctors
            .map((e) => e.specialization)
            .toSet()
            .toList();
        final filteredList = doctors
            .where(
              (docs) => state.checkedSpecialityId == docs.specialization.id,
            )
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: uniqueSpecialization.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final currentSpec = uniqueSpecialization[index];
                  bool isChecked = state.checkedSpecialityId == currentSpec.id;

                  return InkWell(
                    onTap: () {
                      context.read<DoctorCubit>().filterDoctorsBySpeciality(
                        currentSpec.id,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: !isChecked ? Colors.grey[50] : Color(0xff247CFF),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        uniqueSpecialization[index].name,
                        style: TextStyle(
                          color: !isChecked ? Colors.black87 : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              "${filteredList.length} Found",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Expanded(
              child: RecommendationList(
                doctors: filteredList,
                length: filteredList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';

import '../../../../../data/models/home_model/doctor_info.dart';
import '../../../../../logic/doctor_cubit/doctor_cubit.dart';

class CityBottomSheetSection extends StatelessWidget {
  const CityBottomSheetSection({super.key, required this.doctors});
  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (BuildContext context, DoctorState state) {
          final uniqueCity = doctors.map((e) => e.city.name).toSet().toList();
          return ListView.builder(
            itemCount: uniqueCity.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<DoctorCubit>().filterDoctorsByCity(
                    doctors[index].city.id,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: state.checkedCityId != doctors[index].city.id
                        ? Colors.grey[50]
                        : Color(0xff247CFF),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    uniqueCity[index],
                    style: TextStyle(
                      color: state.checkedCityId != doctors[index].city.id
                          ? Colors.black87
                          : Colors.white,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';

class SpecializationsWidget extends StatelessWidget {
  const SpecializationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final item = context.read<DoctorCubit>().getSpecializationsImage();
    return SizedBox(
      height: 12.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Image.asset(
                  item[index]['image'],
                  fit: BoxFit.contain,
                  width: 15.w,
                ),
              ),
              SizedBox(height: 1.h),
              Text(item[index]['name']),
            ],
          );
        },
      ),
    );
  }
}

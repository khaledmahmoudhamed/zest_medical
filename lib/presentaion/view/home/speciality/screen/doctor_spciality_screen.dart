import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';

import '../../../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../../profile/profile_items/widgets/preferedSizedWidget.dart';

class DoctorSpecialityScreen extends StatelessWidget {
  const DoctorSpecialityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = context.read<DoctorCubit>().getSpecializationsImage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSizedWidget(text: "Doctor Speciality"),
      body: GridView.builder(
        itemCount: item.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                margin: EdgeInsets.symmetric(horizontal: 6.w),
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
              Expanded(child: Text(item[index]['name'])),
            ],
          );
        },
      ),
    );
  }
}

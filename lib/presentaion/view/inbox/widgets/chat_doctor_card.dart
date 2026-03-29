import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/constants/colors.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import '../../../../data/models/home_model/doctor_info.dart';

class ChatDoctorCard extends StatelessWidget {
  const ChatDoctorCard({
    super.key,
    required this.doctors,
    required this.length,
  });

  final List<Doctors> doctors;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.chatScreen,
                arguments: doctors[index],
              );
            },
            leading: ClipOval(
              child: CircleAvatar(
                radius: 20.sp,
                backgroundColor:
                    AppColors.bgColors[index % AppColors.bgColors.length],
                child: Center(child: Image.asset('assets/diseases/doctor.png')),
              ),
            ),
            title: Text(doctors[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(doctors[index].specialization.name),
                Text("message content"),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("7:12 AM"),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: .2.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: AppColors.blueColor,
                  ),
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: length,
      ),
    );
  }
}

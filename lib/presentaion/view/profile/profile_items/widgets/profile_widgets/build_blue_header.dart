import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';

class BuildBlueHeader extends StatelessWidget {
  const BuildBlueHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: double.infinity,
      color: const Color(0xff247CFF),
      padding: EdgeInsets.only(top: 6.h, left: 4.w, right: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.settingScreen,
                (route) => true,
              );
            },
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

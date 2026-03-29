import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../cache/hive.dart';
import '../../../../../../core/constants/app_constants_keys.dart';
import '../../../../../../core/utils/app_router.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = CacheHelper.user!.get(ApiKeys.name);
    int index = userName.indexOf(" ");
    String firstName = userName.substring(0, index);
    return ListTile(
      title: Text(
        "Hi, $firstName!",
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("How Are You Today?", style: TextStyle(fontSize: 16.sp)),
      trailing: InkWell(
        borderRadius: BorderRadius.circular(50.sp),
        splashColor: Colors.white,
        onTap: () {
          Navigator.pushNamed(context, AppRouter.notification);
        },
        child: Container(
          width: 12.w,
          height: 12.h,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications_none),
              Positioned(
                bottom: 1.5.h,
                right: 1.5.w,
                child: Container(
                  height: 1.5.h,
                  width: 1.5.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

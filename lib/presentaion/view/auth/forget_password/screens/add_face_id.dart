import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../reusable_widgets/reusabel_button.dart';

class AddFaceIdScreen extends StatelessWidget {
  const AddFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRouter.login);
              },
              containerColor: Color(0xff247CFF),
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 22.sp,
                color: Color(0xff247CFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "At our app, we take the security of your information seriously.",
              style: TextStyle(fontSize: 17.sp, color: Colors.black),
            ),
            SizedBox(height: 5.h),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.white,
                  child: ClipRRect(
                    child: SvgPicture.asset(
                      "assets/face_id.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

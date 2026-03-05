import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/presentaion/reusable_widgets/bottom_indicator.dart';
import '../../../core/utils/app_router.dart';
import '../../reusable_widgets/shared_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomIndicator(),
      body: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset('assets/docdoc.svg', width: 50.w)),
              SizedBox(height: 2.h),
              Stack(
                children: [
                  SvgPicture.asset("assets/splash.svg"),
                  Positioned(
                    right: 3.w,
                    left: 3.w,
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0.0)],
                          stops: const [0.5, 1.0],
                        ).createShader(rect);
                      },
                      child: Image.asset('assets/doctor.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 10.w,
                    right: 10.w,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Best Doctor Appointment App",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff247CFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                child: Text(
                  textAlign: TextAlign.center,
                  "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SharedButton(
                  onTap: () {
                    CacheHelper.isLoggedIn()
                        ? Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRouter.screenHolder)
                        : Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRouter.login);
                  },
                  widget: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
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

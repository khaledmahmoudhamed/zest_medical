import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';

import '../../../../reusable_widgets/reusabel_button.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 2.w),
    width: 17.w,
    height: 8.h,
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey.shade200), // Light grey border
      borderRadius: BorderRadius.circular(12.sp), // Rounded corners
    ),
  );
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, AppRouter.faceId);
                  }
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
                "Otp Verification",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Color(0xff247CFF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "Add a PIN number to make your account more secure and easy to sign in.",
                style: TextStyle(fontSize: 17.sp, color: Colors.black),
              ),
              SizedBox(height: 5.h),
              Pinput(
                length: 4, // Number of PIN digits
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "* required field";
                  }
                  return null;
                },
                controller: controller,
                preFilledWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3.3.h),
                      width: 8.w,
                      height: 0.3.h,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                onCompleted: (pin) => print('Entered PIN: $pin'),
                onChanged: (value) => print('Current value: $value'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

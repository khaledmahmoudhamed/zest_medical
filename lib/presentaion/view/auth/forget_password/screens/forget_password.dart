import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Reset Password",
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
      body: Form(
        key: formKey,
        child: Padding(
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
              ReusableTextFormField(
                controller: passController,
                obscureText: false,
                labelText: "Email or Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.sp),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "* required field";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

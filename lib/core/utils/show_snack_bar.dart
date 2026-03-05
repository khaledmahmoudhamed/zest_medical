import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../presentaion/reusable_widgets/reusabel_button.dart';
import '../../presentaion/view/profile/profile_items/widgets/personal_info_widget/personal_info_content_widget.dart';

class ShowMessageHandler {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: isError
            ? Colors.redAccent
            : const Color(0xff425BAF), // Your brand blue
        behavior: SnackBarBehavior.floating, // Makes it look modern/detached
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(4.w),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showAppDialog({
    required BuildContext context,
    void Function()? onPressed,
    required String content,
    required String title,
    required String cancel,
    required String ok,
    Color? okColor,
    Color? cancelColor,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        content: Text(
          textAlign: TextAlign.center,
          content,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Close dialog
                child: Text(
                  cancel,
                  style: TextStyle(color: cancelColor, fontSize: 16.sp),
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  ok,
                  style: TextStyle(color: okColor, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void showSuccessDialog(
    BuildContext context,
    String total,
    void Function()? onTap,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 35.sp),
            SizedBox(height: 2.h),
            Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.h),
            Text(
              "Your transaction was completed Successfully.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 3.h),

            ReusableButton(
              onTap: onTap,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              radius: 15.sp,
              containerColor: Color(0xff0867d2),
              child: Text(
                "Back",
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showBottomSheetDialog(
    BuildContext context, {
    required VoidCallback onConfirm,
    required TextEditingController passController,
    required TextEditingController confirmPassController,
    required String? passError,
    required String? confirmPassError,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows sheet to push up when keyboard opens
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard padding
          left: 5.w,
          right: 5.w,
          top: 3.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Confirm Identity",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.h),
            Text(
              "Please enter your password to save changes",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 3.h),
            // Your existing reusable text field widget
            PersonalInfoContentWidget(
              labelText: 'Password',
              controller: passController,
              errorText: passError,
            ),
            SizedBox(height: 2.h),
            PersonalInfoContentWidget(
              labelText: 'Confirm Password',
              controller: confirmPassController,
              errorText: confirmPassError,
            ),
            SizedBox(height: 4.h),
            ReusableButton(
              onTap: () {
                if (passController.text == confirmPassController.text &&
                    passController.text.isNotEmpty) {
                  // Pass values back or store them
                  Navigator.pop(context);
                  onConfirm();
                } else {}
              },
              child: Text("Confirm & Save"),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}

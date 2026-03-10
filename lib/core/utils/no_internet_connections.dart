import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../presentaion/reusable_widgets/shared_button.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_rounded, size: 80.sp, color: Colors.blue),
          SizedBox(height: 2.h),
          Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.h),
          Text(
            "Check your settings and try again",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: 60.w,
            child: SharedButton(
              alignment: Alignment.center,
              onTap: onRetry,
              widget: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

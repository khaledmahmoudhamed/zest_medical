import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../reusable_widgets/arrow_back_button.dart';

class PreferredSizedWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PreferredSizedWidget({
    super.key,
    required this.text,
    this.isActionRequired = false,
    this.widget,
    this.actionOnTap,
  });
  final String text;
  final bool isActionRequired;
  final Widget? widget;
  final Function()? actionOnTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox(),
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(5.h), // You can use .h from sizer
        child: AppBar(
          actions: [
            isActionRequired == false
                ? SizedBox()
                : InkWell(
                    onTap: actionOnTap,
                    child: Container(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 3.w),
                      margin: EdgeInsetsGeometry.only(bottom: 1.h, right: 3.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: widget,
                    ),
                  ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            text,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 3.w, bottom: 1.h),
            child: ArrowBackIos(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // ... other properties
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(10.h);
}

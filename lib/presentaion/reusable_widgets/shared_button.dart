import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({
    super.key,
    required this.onTap,
    required this.widget,
    this.alignment,
  });

  final void Function() onTap;
  final Widget widget;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return ReusableButton(
      onTap: onTap,
      alignment: alignment,
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      containerColor: Color(0xff247CFF),
      child: widget,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class AuthSignInOutOptions extends StatelessWidget {
  const AuthSignInOutOptions({
    super.key,
    this.facebookFun,
    this.googleFun,
    this.appleFun,
  });
  final void Function()? facebookFun;
  final void Function()? googleFun;
  final void Function()? appleFun;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: googleFun,
          child: CircleAvatar(
            maxRadius: 20.sp,
            child: SvgPicture.asset("assets/google.svg", width: 8.h),
          ),
        ),
        InkWell(
          onTap: facebookFun,
          child: CircleAvatar(
            maxRadius: 20.sp,
            child: SvgPicture.asset("assets/facebook.svg", width: 8.h),
          ),
        ),
        InkWell(
          onTap: appleFun,

          child: CircleAvatar(
            maxRadius: 20.sp,
            child: SvgPicture.asset("assets/apple.svg"),
          ),
        ),
      ],
    );
  }
}

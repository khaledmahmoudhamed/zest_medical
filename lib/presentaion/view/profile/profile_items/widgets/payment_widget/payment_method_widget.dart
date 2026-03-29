import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.status,
    this.onTap,
  });

  final String image;
  final String title;
  final String subTitle;
  final String status;
  final Function()? onTap;

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  late bool isConnected;

  @override
  void initState() {
    isConnected = CacheHelper.payments!.get(widget.title) ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 5),
            spreadRadius: 0.9,
          ),
        ],
      ),
      child: ListTile(
        onTap: widget.onTap,
        leading: SvgPicture.asset(widget.image),
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        subtitle: Text(widget.subTitle, style: TextStyle(fontSize: 16.sp)),
        trailing: InkWell(
          onTap: () async {
            setState(() {
              isConnected = !isConnected;
            });
            await CacheHelper.payments!.put(widget.title, isConnected);
          },
          child: Text(
            isConnected ? widget.status : "Connect",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: isConnected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

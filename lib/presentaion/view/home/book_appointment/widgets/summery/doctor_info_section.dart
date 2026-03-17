import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/constants/colors.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/reused_doctor_card.dart';

import '../../../../../../data/models/home_model/doctor_info.dart';

class DoctorInfoSection extends StatelessWidget {
  DoctorInfoSection({
    super.key,
    required this.doctors,
    required this.onTap,
    this.isPaymentRequired = true,
  });
  final Doctors doctors;
  final void Function()? onTap;
  final paymentMethod = CacheHelper.user!.get(ApiKeys.userBookingPaymentMethod);
  final bool isPaymentRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusedDoctorCard(
          name: doctors.name,
          specialization: doctors.specialization.name,
          isChatRequired: false,
        ),
        SizedBox(height: 1.h),
        isPaymentRequired
            ? Text(
                "Payment Information",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              )
            : SizedBox(),
        isPaymentRequired
            ? ListTile(
                leading: SvgPicture.asset(paymentMethod['image']),
                title: Text(paymentMethod['title']),
                subtitle: Text(paymentMethod['cardNumber']),
                trailing: ReusableButton(
                  containerColor: AppColors.blueColor,
                  onTap: onTap,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Text("Change", style: TextStyle(color: Colors.white)),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

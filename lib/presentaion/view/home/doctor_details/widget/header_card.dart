import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/reused_doctor_card.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.name,
    required this.specialization,
  });

  final String name;
  final String specialization;
  @override
  Widget build(BuildContext context) {
    return ReusedDoctorCard(
      name: name,
      specialization: specialization,
      isChatRequired: true,
    );
  }
}

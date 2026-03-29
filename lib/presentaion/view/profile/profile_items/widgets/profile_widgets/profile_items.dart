import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';

class ProfileItems extends StatelessWidget {
  ProfileItems({super.key});

  final List profileItems = [
    {
      'title': 'Personal Information',
      "color": Color(0xffEAF2FF),
      "icon": Icons.person_outline,
      "route": AppRouter.personalInformation,
    },
    {
      'title': 'My Test & Diagnostic',
      "color": Color(0xffE7F9EF),
      "icon": Icons.medical_services_outlined,
      "route": AppRouter.medicalRecords,
    },
    {
      'title': 'Payment',
      "color": Color(0xffFFEEEF),
      "icon": Icons.payment_outlined,
      "route": AppRouter.paymentScreen,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: profileItems[index]['color'],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                profileItems[index]['icon'],
                color: Colors.blueAccent,
              ),
            ),
            title: Text(
              profileItems[index]['title'],
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, profileItems[index]['route']);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey[200], thickness: 0.5.h);
        },
        itemCount: profileItems.length,
      ),
    );
  }
}

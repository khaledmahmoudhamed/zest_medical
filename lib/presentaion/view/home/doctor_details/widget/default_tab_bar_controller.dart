import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/about_section.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/loaction_section.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/review_section.dart';

class DefaultTabBarControllerWidget extends StatelessWidget {
  const DefaultTabBarControllerWidget({
    super.key,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.phone,
    required this.price,
    required this.practicePlace,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String description;
  final String startTime;
  final String endTime;
  final String phone;
  final String practicePlace;
  final int price;
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorWeight: 0.3.h,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xff247CFF),
            labelColor: Color(0xff247CFF),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: text1),
              Tab(text: text2),
              Tab(text: text3),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                AboutSection(
                  description: description,
                  startTime: startTime,
                  endTime: endTime,
                  phone: phone,
                  price: price,
                ),
                LocationSection(practicePlace: practicePlace),
                ReviewSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

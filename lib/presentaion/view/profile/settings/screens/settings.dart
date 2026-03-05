import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/bottom_indicator.dart';

import '../../profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/settings_content_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(text: "Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(children: [SettingsContentWidget()]),
        ),
      ),
    );
  }
}

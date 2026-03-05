import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/security_content_widget.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(text: "Security"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
        child: Column(children: [SecurityContentWidget()]),
      ),
    );
  }
}

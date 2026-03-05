import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/faq_content_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(text: "FAQ"),
      body: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: FaqContentWidget(),
      ),
    );
  }
}

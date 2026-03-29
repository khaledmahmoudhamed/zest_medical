import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/notification_content_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(text: "Notification"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
        child: Column(children: [NotificationContentWidget()]),
      ),
    );
  }
}

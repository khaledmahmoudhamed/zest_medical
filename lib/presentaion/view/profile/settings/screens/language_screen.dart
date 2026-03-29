import 'package:flutter/material.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/langauge_content_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),

      appBar: PreferredSizedWidget(text: "Language"),
      body: LanguageContentWidget(),
    );
  }
}

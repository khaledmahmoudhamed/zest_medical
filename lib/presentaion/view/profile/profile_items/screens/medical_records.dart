import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../widgets/medical_record_widgets/medical_record_widget.dart';
import '../widgets/preferedSizedWidget.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(
        text: "Medical Record",
        isActionRequired: true,
        widget: SvgPicture.asset('assets/three_dots.svg', width: 6.w),
      ),
      body: MedicalRecordWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';
import '../register/widgets/intel_phone_widget.dart';
import '../register/widgets/selectGender.dart';

class AuthWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Widget> fields; // Pass the actual widgets here
  final double? headerSpacing;

  const AuthWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.fields,
    this.headerSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff247CFF),
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          subTitle,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
        ),
        SizedBox(height: headerSpacing ?? 4.h),

        // Fields Section (Spread the list of widgets)
        ...fields.map(
          (field) => Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: field,
          ),
        ),
      ],
    );
  }
}

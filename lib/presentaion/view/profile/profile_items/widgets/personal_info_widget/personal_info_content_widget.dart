import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';

class PersonalInfoContentWidget extends StatelessWidget {
  const PersonalInfoContentWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.errorText,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
  });
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return ReusableTextFormField(
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      errorText: errorText,
      obscureText: false,
      labelText: labelText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.sp)),
    );
  }
}

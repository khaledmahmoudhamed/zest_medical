import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';

class SearchAndIconRow extends StatelessWidget {
  const SearchAndIconRow({
    super.key,
    this.onChanged,
    required this.widget,
    this.fillColor,
    this.filled,
    this.hintStyle,
    this.searchColor,
    required this.controller,
    this.textStyle,
    this.onFieldSubmitted,
  });
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final Widget widget;
  final Color? fillColor;
  final Color? searchColor;
  final bool? filled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ReusableTextFormField(
            onFieldSubmitted: onFieldSubmitted,
            textStyle: textStyle,
            fillColor: fillColor,
            controller: controller,
            filled: filled,
            obscureText: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            hintText: "Search",
            hintStyle: hintStyle,
            prefixIcon: Icon(Icons.search, color: searchColor),
            onChanged: onChanged,
            keyboardType: TextInputType.text,
          ),
        ),
        widget,
      ],
    );
  }
}

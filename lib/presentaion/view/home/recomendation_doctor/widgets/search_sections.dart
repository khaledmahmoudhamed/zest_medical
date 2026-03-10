import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';

class SearchSections extends StatelessWidget {
  SearchSections({super.key, this.onChanged, this.onPressed});
  final Function(String)? onChanged;
  final void Function()? onPressed;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ReusableTextFormField(
            controller: controller,
            obscureText: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            onChanged: onChanged,
            keyboardType: TextInputType.text,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.filter_list_sharp, size: 25.sp),
        ),
      ],
    );
  }
}

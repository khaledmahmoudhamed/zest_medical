import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/toggle/toggle_icon_cubit.dart';
import '../../../../logic/toggle/toggle_icon_state.dart';
import '../../../reusable_widgets/reusable_text_form_filed.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const PasswordFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIconCubit, ToggleIconState>(
      // Only rebuild this specific field when visibility changes
      buildWhen: (previous, current) =>
          previous.togglePasswordVisibility != current.togglePasswordVisibility,
      builder: (context, state) {
        return ReusableTextFormField(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          controller: controller,
          obscureText: !state.togglePasswordVisibility,
          hintText: hintText,
          labelText: hintText,
          suffixIcon: IconButton(
            icon: Icon(
              state.togglePasswordVisibility
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: state.togglePasswordVisibility ? Colors.blue : Colors.grey,
            ),
            onPressed: () =>
                context.read<ToggleIconCubit>().togglePasswordVisibility(),
          ),
          validator: validator,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIconCubit, ToggleIconState>(
      builder: (BuildContext context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: state.toggleTermsVisibility,
              onChanged: (val) {
                context.read<ToggleIconCubit>().toggleCheckBoxVisibility();
              },
              fillColor: WidgetStateProperty.resolveWith((val) {
                if (val.contains(WidgetState.selected)) {
                  return Color(0xff247CFF);
                } else {
                  return Colors.white;
                }
              }),
              checkColor: Colors.white,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.forgetPassword,
                );
              },
              child: Text(
                "forget password?",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        );
      },
    );
  }
}

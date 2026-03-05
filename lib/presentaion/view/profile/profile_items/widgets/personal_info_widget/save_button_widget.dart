import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';

import '../../../../../../core/utils/show_snack_bar.dart';
import '../../../../../../logic/auth_cubit/auth_cubit.dart';
import '../../../../../reusable_widgets/shared_button.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.state,
    this.apiErrors,
    required this.onTap,
  });

  final AuthState state;
  final dynamic apiErrors;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SharedButton(
      onTap: onTap,
      widget: state is UpdateProfileAuthLoadingState
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              'Save Changes',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

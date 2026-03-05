import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';

import '../../../../../core/utils/no_internet_connections.dart';
import '../widgets/profile_widgets/build_blue_header.dart';
import '../widgets/profile_widgets/build_error_widget.dart';
import '../widgets/profile_widgets/build_profile_body.dart';
import '../widgets/profile_widgets/build_profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is ProfileAuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileAuthSuccessState) {
            final user = state.model.getUserData[0];
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  BuildBlueHeader(),
                  BuildProfileBody(name: user.name, email: user.email),
                  Positioned(
                    top: 13.h,
                    left: 0,
                    right: 0,
                    child: BuildProfileImage(),
                  ),
                ],
              ),
            );
          }

          if (state is ProfileAuthFailedState) {
            if (state.error.contains("Internet")) {
              return NoInternetWidget(
                onRetry: () {
                  context.read<AuthCubit>().getUserProfile();
                },
              );
            }
            return BuildErrorWidget(error: state.error);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

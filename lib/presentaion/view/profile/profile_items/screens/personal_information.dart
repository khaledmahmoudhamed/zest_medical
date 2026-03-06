import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/view/profile/profile_items/widgets/personal_info_widget/save_button_widget.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../../logic/auth_cubit/auth_cubit.dart';
import '../../../../../logic/auth_cubit/auth_state.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/shared_button.dart';
import '../../../auth/register/widgets/intel_phone_widget.dart';
import '../../../auth/register/widgets/selectGender.dart';
import '../widgets/personal_info_widget/personal_info_content_widget.dart';
import '../widgets/personal_info_widget/personal_info_widget.dart';
import '../widgets/preferedSizedWidget.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  int selectedGender = 0;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    context.read<AuthCubit>().getUserProfile();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomIndicator(),
      appBar: PreferredSizedWidget(text: "Personal Information"),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GetProfileSuccessState) {
            final user = state.model.getUserData[0];
            nameController.text = user.name;
            emailController.text = user.email;
            phoneController.text = user.phone;
            selectedGender = (user.gender == 'male' || user.gender == '0')
                ? 0
                : 1;
          }

          if (state is UpdateProfileSuccessState) {
            ShowMessageHandler.showSnackBar(
              context,
              message: "Profile updated successfully!",
              isError: false,
            );
            passController.clear();
            confirmPassController.clear();
            // Refresh the profile data
            context.read<AuthCubit>().getUserProfile();
          }
        },
        builder: (context, state) {
          if (state is GetProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          // Safe error mapping
          final apiErrors = (state is UpdateProfileFailedState)
              ? state.error.errors
              : null;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const PersonImageWidget(),
                          SizedBox(height: 5.h),
                          PersonalInfoContentWidget(
                            labelText: 'Full Name',
                            controller: nameController,
                            errorText: apiErrors?.name,
                          ),
                          SizedBox(height: 2.h),
                          PersonalInfoContentWidget(
                            labelText: 'Email Address',
                            controller: emailController,
                            errorText: apiErrors?.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 2.h),
                          IntelPhoneWidget(
                            controller: phoneController,
                            errorText: apiErrors?.phone,
                          ),
                          SizedBox(height: 2.h),
                          SelectedGender(selectedGender: selectedGender),
                          SizedBox(height: 3.h),
                          Text(
                            "Ensure your information is accurate to receive proper medical assistance.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SaveButtonWidget(
                    state: state,
                    onTap: () {
                      ShowMessageHandler.showBottomSheetDialog(
                        context,
                        passController: passController,
                        confirmPassController: confirmPassController,
                        passError: apiErrors?.password,
                        confirmPassError: apiErrors?.confirmPass,
                        onConfirm: () {
                          context.read<AuthCubit>().updateProfile(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            gender: selectedGender.toString(),
                            password: passController.text,
                            confirmPassword: confirmPassController.text,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/reusable_text_form_filed.dart';
import '../../../../reusable_widgets/shared_button.dart';
import '../../shared_widgets/auth_sign_in_out_options.dart';
import '../../shared_widgets/auth_widget.dart';
import '../../shared_widgets/devider_section.dart';
import '../../shared_widgets/have_account_section.dart';
import '../../shared_widgets/password_form_field.dart';
import '../../shared_widgets/privacy_policy_terms.dart';
import '../widgets/intel_phone_widget.dart';
import '../widgets/selectGender.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = [
      nameController,
      emailController,
      phoneController,
      genderController,
      passwordController,
      confirmPassController,
    ];
    List<String> hintText = [
      'name',
      'email',
      'phone',
      'gender',
      'password',
      'confirm password',
    ];
    int selectedIndex = 0;
    return Scaffold(
      bottomNavigationBar: BottomIndicator(),
      body: Form(
        key: formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, state) async {
            if (state is RegisterFailedState) {
              ShowMessageHandler.showSnackBar(
                context,
                message: state.error,
                isError: true,
              );
            } else if (state is RegisterSuccessState) {
              ShowMessageHandler.showSnackBar(
                context,
                message:
                    "Success! You’ve taken the first step toward better health. Let's get started.",
                isError: false,
              );
              await Future.delayed(
                Duration(seconds: 3),
                () => Navigator.pushReplacementNamed(context, AppRouter.login),
              );
            }
          },
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthWidget(
                      title: 'Create Account',
                      subTitle: 'Sign up to get started',
                      fields: [
                        ReusableTextFormField(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          controller: nameController,
                          hintText: 'Full Name',
                          obscureText: false,
                        ),
                        ReusableTextFormField(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),
                        IntelPhoneWidget(controller: phoneController),
                        SelectedGender(
                          selectedGender: selectedIndex,
                        ), // No more "index == 3" hacks!
                        PasswordFormField(
                          controller: passwordController,
                          hintText: 'Password',
                        ),
                        PasswordFormField(
                          controller: confirmPassController,
                          hintText: 'Confirm Password',
                          validator: (val) => val != passwordController.text
                              ? "No match"
                              : null,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    state is RegisterLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : SharedButton(
                            alignment: Alignment.center,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  gender: selectedIndex.toString(),
                                  password: passwordController.text,
                                  confirmPassword: confirmPassController.text,
                                );
                              }
                            },
                            widget: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    SizedBox(height: 1.4.h),
                    DividerSection(),
                    SizedBox(height: 0.2.h),
                    AuthSignInOutOptions(),
                    SizedBox(height: 0.9.h),
                    PrivacyPolicySection(),
                    SizedBox(height: 0.7.h),
                    HaveAccountSection(
                      text: 'Sign In',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRouter.login,
                        );
                      },
                    ),
                    SizedBox(height: 1.5.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/shared_button.dart';
import '../../shared_widgets/auth_sign_in_out_options.dart';
import '../../shared_widgets/auth_widget.dart';
import '../../shared_widgets/devider_section.dart';
import '../../shared_widgets/have_account_section.dart';
import '../../shared_widgets/privacy_policy_terms.dart';

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
            if (state is RegisterAuthFailedState) {
              ShowMessageHandler.showSnackBar(
                context,
                message: state.error,
                isError: true,
              );
            } else if (state is RegisterAuthSuccessState) {
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
                      subTitle:
                          "Sign up now and start exploring all that "
                          "our app has to offer.We're excited to welcome you to our community!",
                      listLength: 6,
                      controller: controllers,
                      obscureText: false,
                      hintText: hintText,
                      isLogin: false,
                      labelText: hintText,
                      height1: 0.h,
                      height2: 1.h,
                      paddingHeight: 0.4.h,
                      selectedIndex: selectedIndex,
                    ),
                    SizedBox(height: 2.h),
                    state is RegisterAuthLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : SharedButton(
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

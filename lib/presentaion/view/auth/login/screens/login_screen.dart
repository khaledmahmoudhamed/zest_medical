import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../../../../reusable_widgets/shared_button.dart';
import '../../forget_password/widgets/forget_password.dart';
import '../../shared_widgets/auth_sign_in_out_options.dart';
import '../../shared_widgets/auth_widget.dart';
import '../../shared_widgets/devider_section.dart';
import '../../shared_widgets/have_account_section.dart';
import '../../shared_widgets/privacy_policy_terms.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = [
      emailController,
      passwordController,
    ];
    List<String> hintText = ['email', 'password'];
    return Scaffold(
      bottomNavigationBar: BottomIndicator(),
      body: Form(
        key: formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) async {
            if (state is LoginAuthFailedState) {
              ShowMessageHandler.showSnackBar(
                context,
                message: state.error,
                isError: true,
              );
            } else if (state is LoginAuthSuccessState) {
              ShowMessageHandler.showSnackBar(
                context,
                message: "Welcome Back ${state.model.data.userName}",
                isError: false,
              );
              if (context.mounted) {
                return await Future.delayed(
                  Duration(seconds: 2),
                  () => Navigator.pushReplacementNamed(
                    context,
                    AppRouter.screenHolder,
                  ),
                );
              }
            }
          },
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.only(top: 8.h, left: 4.w, right: 4.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthWidget(
                      title: 'Welcome Back',
                      subTitle:
                          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                      listLength: 2,
                      controller: controllers,
                      obscureText: false,
                      hintText: hintText,
                      isLogin: true,
                      labelText: hintText,
                      height1: 0.h,
                      height2: 5.h,
                      paddingHeight: 1.h,
                    ),
                    ForgetPasswordWidget(),
                    SizedBox(height: 5.h),
                    state is LoginAuthLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : SharedButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            widget: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    SizedBox(height: 5.h),
                    DividerSection(),
                    SizedBox(height: 2.h),
                    AuthSignInOutOptions(),
                    SizedBox(height: 3.h),
                    PrivacyPolicySection(),
                    SizedBox(height: 2.h),
                    HaveAccountSection(
                      text: 'Sign Up',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRouter.register,
                        );
                      },
                    ),
                    // BottomIndicator(),
                    // SizedBox(height: 2.h),
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

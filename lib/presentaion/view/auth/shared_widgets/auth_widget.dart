import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';
import '../register/widgets/intel_phone_widget.dart';
import '../register/widgets/selectGender.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.listLength,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    this.isLogin = false,
    required this.labelText,
    required this.height1,
    required this.height2,
    required this.paddingHeight,
    this.selectedIndex,
  });

  final String title;
  final String subTitle;
  final List<String> labelText;
  final int listLength;
  final List<TextEditingController> controller;
  final List<String> hintText;
  final bool obscureText;
  final bool isLogin;
  final double height1;
  final double height2;
  final double paddingHeight;
  final int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff247CFF),
          ),
        ),
        SizedBox(height: height1),
        Text(
          textAlign: TextAlign.start,
          subTitle,
          style: TextStyle(fontSize: 17.sp),
        ),
        SizedBox(height: height2),
        ...List.generate(listLength, (index) {
          return BlocBuilder<ToggleIconCubit, ToggleIconState>(
            builder: (BuildContext context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: paddingHeight),
                child: index == 2
                    ? IntelPhoneWidget(
                        controller: controller[2],
                        validator: (phone) {
                          if (phone == null || phone.number.isEmpty) {
                            return "* this field is required";
                          }

                          return null;
                        },
                      )
                    : index == 3
                    ? SelectedGender(selectedGender: selectedIndex!)
                    : ReusableTextFormField(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        controller: controller[index],
                        obscureText:
                            isLogin == false && index == 4 || index == 5
                            ? state.togglePasswordVisibility
                            : isLogin == true && index == 1
                            ? state.togglePasswordVisibility
                            : false,
                        hintText: hintText[index],
                        suffixIcon: isLogin == false && listLength - 1 == index
                            ? InkWell(
                                onTap: () {
                                  context
                                      .read<ToggleIconCubit>()
                                      .togglePasswordVisibility();
                                },
                                child: Icon(
                                  state.togglePasswordVisibility
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: state.togglePasswordVisibility
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                              )
                            : isLogin == true && index == 1
                            ? InkWell(
                                onTap: () {
                                  context
                                      .read<ToggleIconCubit>()
                                      .togglePasswordVisibility();
                                },
                                child: Icon(
                                  state.togglePasswordVisibility
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: state.togglePasswordVisibility
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                              )
                            : SizedBox(),
                        keyboardType: isLogin == false && index == 2
                            ? TextInputType.phone
                            : TextInputType.text,
                        labelText: hintText[index],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "* this field is required";
                          }
                          if (index == 4) {
                            if (controller[4].text != controller[5].text) {
                              return "password doesn't match";
                            }
                          }

                          return null;
                        },
                      ),
              );
            },
          );
        }),
      ],
    );
  }
}

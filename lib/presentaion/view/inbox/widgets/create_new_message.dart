import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';

import '../../../../core/constants/colors.dart';
import '../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../home/recomendation_doctor/widgets/bottom_sheet.dart';
import '../../home/recomendation_doctor/widgets/search&icon_row.dart';

class CreateNewMessage extends StatefulWidget {
  const CreateNewMessage({super.key});

  @override
  State<CreateNewMessage> createState() => _CreateNewMessageState();
}

class _CreateNewMessageState extends State<CreateNewMessage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              height: 95.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.sp),
                  topLeft: Radius.circular(15.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 3.h, left: 4.w, right: 4.w),
                child: BlocBuilder<DoctorCubit, DoctorState>(
                  builder: (BuildContext context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close),
                            ),
                            Text(
                              "Create New Message",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        SearchAndIconRow(
                          controller: controller,
                          onChanged: (val) {
                            context.read<DoctorCubit>().searchDoctors(val);
                            setState(() {});
                          },
                          onFieldSubmitted: (val) {},

                          widget: IconButton(
                            onPressed: () {
                              final currentState = context
                                  .read<DoctorCubit>()
                                  .state;

                              BottomSheetClass.showBottomSheet(
                                context,
                                currentState.allDoctorsList,
                              );
                            },
                            icon: Icon(Icons.filter_list_sharp, size: 25.sp),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: ClipOval(
                                  child: CircleAvatar(
                                    radius: 20.sp,
                                    backgroundColor:
                                        AppColors.bgColors[index %
                                            AppColors.bgColors.length],
                                    child: Image.asset(
                                      'assets/diseases/doctor.png',
                                    ),
                                  ),
                                ),
                                title: Text(
                                  state.createMessageList[index].name,
                                ),
                                subtitle: Text(
                                  state
                                      .createMessageList[index]
                                      .specialization
                                      .name,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: state.createMessageList.length,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add_comment_outlined),
    );
  }
}

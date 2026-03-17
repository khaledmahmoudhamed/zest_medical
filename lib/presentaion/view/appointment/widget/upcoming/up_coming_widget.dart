import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/upcoming/appointment_list.dart';
import '../../../../../logic/patient_cubit/patient_cubit.dart';

class UpComingWidget extends StatelessWidget {
  const UpComingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (BuildContext context, state) {
        if (state.patientStatus == PatientStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        final upComing = state.patientList
            .where((e) => e.isUpComing && !state.canceledIdList.contains(e.id))
            .toList();
        if (upComing.isEmpty) {
          return Center(
            child: Text(
              "No upcoming appointments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: upComing.length,
          itemBuilder: (context, index) {
            return AppointmentList(
              cancelOnTap: () async {
                context.read<PatientCubit>().canceledAppointments(
                  upComing[index].id,
                );
                ShowMessageHandler.showSnackBar(
                  context,
                  message: "Appointment Canceled Successfully",
                );
              },
              rescheduleOnTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.rescheduleScreen,
                  arguments: {
                    'doctor': upComing[index].doctor,
                    'dateTime': state.patientList[index].startTime,
                  },
                );
              },
              doctorName: upComing[index].doctor!.name,
              doctorSpecialization: upComing[index].doctor!.specialization.name,
              appointmentTime: upComing[index].startTime,
            );
          },
        );
      },
    );
  }
}

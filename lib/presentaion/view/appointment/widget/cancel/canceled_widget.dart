import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../logic/patient_cubit/patient_cubit.dart';
import '../../../../../logic/patient_cubit/patient_state.dart';
import '../completed/card.dart';

class CanceledWidget extends StatelessWidget {
  const CanceledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        if (state.patientStatus == PatientStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        final canceledAppointment = state.patientList
            .where((e) => state.canceledIdList.contains(e.id))
            .toList();
        if (canceledAppointment.isEmpty) {
          return Center(
            child: Text(
              "No Canceled Appointments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: canceledAppointment.length,
          itemBuilder: (context, index) {
            return CardSection(
              date: canceledAppointment[index].startTime,
              doctorName: canceledAppointment[index].doctor!.name,
              doctorSpecialization:
                  canceledAppointment[index].doctor!.specialization.name,
              text: 'Appointment Canceled',
              color: Colors.red,
            );
          },
        );
      },
    );
  }
}

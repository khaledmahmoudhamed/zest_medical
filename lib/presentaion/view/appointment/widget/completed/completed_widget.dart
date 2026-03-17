import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/logic/patient_cubit/patient_cubit.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';
import 'card.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        if (state.patientStatus == PatientStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        final completed = state.patientList
            .where((e) => e.isCompleted)
            .toList();
        if (completed.isEmpty) {
          return Center(child: Text("No completed appointments"));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: completed.length,
          itemBuilder: (context, index) {
            return CardSection(
              date: completed[index].startTime,
              doctorName: completed[index].doctor!.name,
              doctorSpecialization:
                  completed[index].doctor!.specialization.name,
              text: "Appointment done",
              color: Colors.green,
            );
          },
        );
      },
    );
  }
}

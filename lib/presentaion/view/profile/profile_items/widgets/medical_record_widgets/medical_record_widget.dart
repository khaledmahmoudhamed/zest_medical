import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/data/models/user_model/user_records.dart';
import 'package:zest_medical/logic/medical_cubit/medical_cubit.dart';
import 'package:zest_medical/logic/medical_cubit/medical_state.dart';
import 'package:zest_medical/presentaion/view/profile/profile_items/widgets/medical_record_widgets/record_items_widget.dart';

class MedicalRecordWidget extends StatefulWidget {
  const MedicalRecordWidget({super.key});

  @override
  State<MedicalRecordWidget> createState() => _MedicalRecordWidgetState();
}

class _MedicalRecordWidgetState extends State<MedicalRecordWidget> {
  @override
  void initState() {
    context.read<MedicalCubit>().getMedicalRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalCubit, MedicalState>(
      builder: (BuildContext context, state) {
        if (state is MedicalLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MedicalSuccessState) {
          return ListView.separated(
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              final record = state.records[index];

              return RecordItemsWidget(
                month: record.month,
                date: record.date,
                title: record.title,
                redBloodCells: record.redBloodCells,
                whiteBloodCells: record.whiteBloodCells,
                hematocrit: record.hematocrit,
                hemoglobin: record.hematocrit,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(thickness: 0.5.h, color: Colors.grey[50]);
            },
          );
        } else {
          return Center(child: Text("No records available"));
        }
      },
    );
  }
}

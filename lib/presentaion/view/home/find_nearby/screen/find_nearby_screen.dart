import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/presentaion/reusable_widgets/arrow_back_button.dart';
import '../../../../../data/models/home_model/doctor_info.dart';
import '../widget/search&icon_section.dart';
import '../widget/show_map_section.dart';

class FindNearbyScreen extends StatefulWidget {
  const FindNearbyScreen({super.key});

  @override
  State<FindNearbyScreen> createState() => _FindNearbyScreenState();
}

class _FindNearbyScreenState extends State<FindNearbyScreen> {
  Doctors? selectedDoctor;
  late Doctors doctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Find Nearby",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: ArrowBackIos(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0.3,
        shadowColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 10.h),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: SearchANdIconSection(
              onTap: () {},
              onChanged: (val) {
                context.read<DoctorCubit>().searchDoctors(val);
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              ShowMapSection(),
              if (state.searchDoctorStatus == DoctorStatus.loading)
                Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}

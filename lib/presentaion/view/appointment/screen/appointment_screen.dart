import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/patient_cubit/patient_cubit.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/cancel/canceled_widget.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/completed/completed_widget.dart';
import 'package:zest_medical/presentaion/view/appointment/widget/upcoming/up_coming_widget.dart';
import '../../profile/profile_items/widgets/preferedSizedWidget.dart';

class NavAppointmentItem extends StatefulWidget {
  const NavAppointmentItem({super.key});

  @override
  State<NavAppointmentItem> createState() => _NavAppointmentItemState();
}

class _NavAppointmentItemState extends State<NavAppointmentItem> {
  @override
  void initState() {
    context.read<PatientCubit>().getAllAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSizedWidget(
        text: "My Appointment",
        isActionRequired: true,
        actionIcon: Icon(Icons.search),
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorWeight: 0.3.h,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Color(0xff247CFF),
                    labelColor: Color(0xff247CFF),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Upcoming"),
                      Tab(text: "Completed"),
                      Tab(text: "Canceled"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        UpComingWidget(),
                        CompletedWidget(),
                        CanceledWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

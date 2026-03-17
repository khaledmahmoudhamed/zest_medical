import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';
import 'package:zest_medical/presentaion/view/home/home/widget/specializations_section.dart';
import 'package:zest_medical/presentaion/view/serach/widgets/recent_search_widget.dart';
import 'package:zest_medical/presentaion/view/serach/widgets/specializations_widget.dart';

import '../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../home/recomendation_doctor/widgets/bottom_sheet.dart';
import '../../home/recomendation_doctor/widgets/search&icon_row.dart';
import '../../profile/profile_items/widgets/preferedSizedWidget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<DoctorCubit>().getAllDoctors();
    super.initState();
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSizedWidget(text: "Search"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 3.h, left: 2.w, right: 2.w),
        child: Column(
          children: [
            SearchAndIconRow(
              controller: controller,
              onChanged: (val) {
                context.read<DoctorCubit>().searchDoctors(val);
                setState(() {});
              },
              onFieldSubmitted: (val) {
                if (val.trim().isNotEmpty) {
                  List<String> recentSearch = List<String>.from(
                    CacheHelper.recentSearch!.get(
                      "recent",
                      defaultValue: <String>[],
                    ),
                  );

                  if (!recentSearch.contains(val)) {
                    recentSearch.insert(0, val);
                    if (recentSearch.length > 10) {
                      recentSearch.removeLast(); // Keep it clean
                    }
                    CacheHelper.recentSearch!.put("recent", recentSearch);
                  }
                }
              },

              widget: IconButton(
                onPressed: () {
                  final currentState = context.read<DoctorCubit>().state;

                  BottomSheetClass.showBottomSheet(
                    context,
                    currentState.allDoctorsList,
                  );
                },
                icon: Icon(Icons.filter_list_sharp, size: 25.sp),
              ),
            ),
            SizedBox(height: 2.h),

            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (BuildContext context, state) {
                if (state.recommendedDoctorStatus == DoctorStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.recommendedDoctorStatus ==
                    DoctorStatus.loaded) {
                  return /*controller.text.isEmpty
                      ? RecentSearchWidget()
                      :*/ Expanded(
                    child: SearchBySpecializationsWidget(
                      doctors: state.allDoctorsList,
                    ),
                  );
                } else if (state.searchDoctorStatus == DoctorStatus.failed) {
                  return Center(child: Text(state.error!));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

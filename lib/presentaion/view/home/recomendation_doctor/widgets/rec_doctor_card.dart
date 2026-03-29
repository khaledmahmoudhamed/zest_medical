import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../data/models/home_model/doctor_info.dart';

class RecoDoctorCard extends StatelessWidget {
  const RecoDoctorCard({
    super.key,
    required this.length,
    required this.doctors,
  });
  final int length;
  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.doctorDetailsScreen,
                arguments: doctors[index],
              );
            },
            child: Container(
              height: 20.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                    spreadRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/diseases/doctor.png",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topLeft,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          doctors[index].name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          doctors[index].specialization.name,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          doctors[index].city.name,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Color(0xffFFD600)),
                            Row(
                              children: [
                                Text("4.8", style: TextStyle(fontSize: 16.sp)),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "(4.279 reviews)",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

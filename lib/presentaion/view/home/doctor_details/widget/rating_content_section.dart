import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/rating_cubit/rating_cubit.dart';
import 'package:zest_medical/logic/rating_cubit/rating_state.dart';

import '../../../../../cache/hive.dart';
import '../../../../../core/constants/app_constants_keys.dart';

class RatingContentSection extends StatelessWidget {
  const RatingContentSection({super.key});
  @override
  Widget build(BuildContext context) {
    final image = CacheHelper.user!.get(ApiKeys.userImage);
    final name = CacheHelper.user!.get(ApiKeys.name);
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (BuildContext context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.reviews.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 20.sp,
                      backgroundImage: FileImage(File(image)),
                    ),
                    title: Text(name),
                    subtitle: RatingBarIndicator(
                      itemCount: 5,
                      itemSize: 20.sp,
                      rating: 3.5,
                      unratedColor: Colors.black38,
                      itemBuilder: (context, index) {
                        return Icon(Icons.star, color: Colors.amber);
                      },
                    ),
                    trailing: Text(
                      state.reviews[index].dateTime,
                      style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: Text(state.reviews[index].text),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

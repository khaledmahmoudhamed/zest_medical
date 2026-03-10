import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/colors.dart';
import 'package:zest_medical/logic/rating_cubit/rating_cubit.dart';
import 'package:zest_medical/logic/rating_cubit/rating_state.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusabel_button.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';
import 'package:zest_medical/presentaion/view/home/doctor_details/widget/rating_content_section.dart';

class ReviewSection extends StatefulWidget {
  ReviewSection({super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final controller = TextEditingController();

  double userRating = 0;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        RatingContentSection(),
        SizedBox(height: 4.h),
        context.read<RatingCubit>().state.reviews.isNotEmpty
            ? const Divider()
            : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h),
              Text("Give Rate", style: TextStyle(fontSize: 18.sp)),
              SizedBox(height: 1.h),
              RatingBar.builder(
                unratedColor: Colors.black38,
                itemCount: 5,
                itemSize: 20.sp,
                initialRating: 0,
                maxRating: 1,
                itemBuilder: (context, index) {
                  return Icon(Icons.star, color: Colors.amber);
                },
                onRatingUpdate: (val) => userRating = val,
              ),
              SizedBox(height: 1.h),
              Text(
                "Share Your Feedback About The Doctor",
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(height: 1.h),
              ReusableTextFormField(
                hintText: "Tell us about your visit...",
                controller: controller,
                obscureText: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
              SizedBox(height: 2.h),
              ReusableButton(
                alignment: Alignment.center,
                containerColor: AppColors.blueColor,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(vertical: 0.8.h),
                onTap: () async {
                  context.read<RatingCubit>().addReview(
                    controller.text,
                    userRating,
                  );
                  controller.clear();
                  FocusScope.of(context).unfocus();
                },
                child: Text(
                  "Submit Review",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

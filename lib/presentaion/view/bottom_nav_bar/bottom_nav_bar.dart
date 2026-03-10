import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.image,
  });

  final int currentIndex;
  final void Function(int) onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.center,
      children: [
        Container(
          height: 8.h,
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => onTap(0),
                    icon: Icon(
                      size: 25.sp,
                      Icons.home_outlined,
                      color: currentIndex == 0
                          ? const Color(0xff247CFF)
                          : Colors.black,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () => onTap(1),
                        icon: Icon(
                          size: 25.sp,
                          Icons.chat_outlined,
                          color: currentIndex == 1
                              ? const Color(0xff247CFF)
                              : Colors.black,
                        ),
                      ),
                      Positioned(
                        right: 10.sp,
                        top: 10.sp,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red, // The notification dot
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () => onTap(3),
                    icon: Icon(
                      size: 25.sp,
                      Icons.date_range,
                      color: currentIndex == 3
                          ? const Color(0xff247CFF)
                          : Colors.black,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  GestureDetector(
                    onTap: () => onTap(4),
                    child: CircleAvatar(
                      radius: 25.sp,
                      backgroundColor: Colors.white,
                      backgroundImage: image.isNotEmpty
                          ? NetworkImage(image)
                          : null,
                      child: image.isEmpty
                          ? /*Icon(
                              Icons.person,
                              color: currentIndex == 4
                                  ? const Color(0xff247CFF)
                                  : Colors.black,
                              size: 25.sp,
                            )*/ SvgPicture.asset(
                              "assets/profile.svg",
                              width: 25.sp,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 4.h,
          child: GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              // margin: EdgeInsets.only(bottom: 3.5.h),
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                color: const Color(0xff247CFF),
                borderRadius: BorderRadius.circular(20.sp),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff247CFF).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.search, color: Colors.white, size: 25.sp),
            ),
          ),
        ),
      ],
    );
  }
}

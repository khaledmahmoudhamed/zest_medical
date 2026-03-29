import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../recomendation_doctor/widgets/search&icon_row.dart';

class SearchANdIconSection extends StatelessWidget {
  SearchANdIconSection({super.key, this.onChanged, this.onTap});
  final Function(String)? onChanged;
  final void Function()? onTap;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SearchAndIconRow(
      onChanged: onChanged,
      filled: true,
      fillColor: Colors.black38,
      hintStyle: TextStyle(color: Colors.white),
      searchColor: Colors.white,
      widget: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.w),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Colors.black38,
          ),
          child: Icon(Icons.tune, color: Colors.white),
        ),
      ),
      controller: controller,
    );
  }
}

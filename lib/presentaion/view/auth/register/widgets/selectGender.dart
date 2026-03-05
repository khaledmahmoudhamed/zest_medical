import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectedGender extends StatefulWidget {
  SelectedGender({super.key, required this.selectedGender});
  late int selectedGender;

  @override
  State<SelectedGender> createState() => _SelectedGenderState();
}

class _SelectedGenderState extends State<SelectedGender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              backgroundColor: widget.selectedGender == 0
                  ? const Color(0xff247CFF)
                  : Colors.white,
              foregroundColor: widget.selectedGender == 0
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () => setState(() => widget.selectedGender = 0),
            child: const Text("Male"),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              backgroundColor: widget.selectedGender == 1
                  ? const Color(0xff247CFF)
                  : Colors.white,
              foregroundColor: widget.selectedGender == 1
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () => setState(() => widget.selectedGender = 1),
            child: const Text("Female"),
          ),
        ),
      ],
    );
  }
}

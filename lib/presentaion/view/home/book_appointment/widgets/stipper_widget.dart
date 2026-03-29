import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key, required this.activeStep});
  final int activeStep;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
        lineLength: 20.w,
        lineType: LineType.normal,
        defaultLineColor: Colors.grey[300],
        activeLineColor: Colors.blue,
        finishedLineColor: Colors.green,
        lineThickness: 2,
      ),
      activeStepTextColor: Colors.black,
      finishedStepTextColor: Colors.green,
      internalPadding: 10.w,
      showLoadingAnimation: false,
      stepRadius: 15.sp,
      showStepBorder: false,
      steps: [
        EasyStep(customStep: _buildCircle(1, activeStep), title: 'Date & Time'),
        EasyStep(customStep: _buildCircle(2, activeStep), title: 'Payment'),
        EasyStep(customStep: _buildCircle(3, activeStep), title: 'Summary'),
      ],
      onStepReached: (index) {},
    );
  }

  Widget _buildCircle(int number, int activeStep) {
    bool isFinished = number < (activeStep + 1);
    bool isActive = number == (activeStep + 1);
    return CircleAvatar(
      radius: 15.sp,

      backgroundColor: isActive
          ? Colors.blue
          : isFinished
          ? Colors.green
          : Colors.grey[300],
      child: Text('$number', style: const TextStyle(color: Colors.white)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../widgets/payment_widget/payment_body_widget.dart';
import '../widgets/preferedSizedWidget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(
        text: "Payment",
        isActionRequired: true,
        widget: SvgPicture.asset('assets/scanner.svg', fit: BoxFit.contain),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: PaymentBodyWidget(),
      ),
    );
  }
}

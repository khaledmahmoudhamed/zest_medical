import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/utils/app_router.dart';

class PaymentStepperWidget extends StatefulWidget {
  const PaymentStepperWidget({super.key});

  @override
  State<PaymentStepperWidget> createState() => _PaymentStepperWidgetState();
}

class _PaymentStepperWidgetState extends State<PaymentStepperWidget> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List paymentOptions =
        CacheHelper.payments!.get(ApiKeys.addPaymentMethod) ?? [];

    List paymentStatus = paymentOptions.where((option) {
      return CacheHelper.payments!.get(option['title']) == true;
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Option",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        paymentStatus[selectedIndex]['title'] == true
            ? Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.paymentScreen);
                  },
                  child: Text("Add Payment method"),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      setState(() {
                        selectedIndex = index;
                      });
                      await CacheHelper.user!.put(
                        ApiKeys.userBookingPaymentMethod,
                        paymentOptions[index],
                      );
                    },
                    leading: SvgPicture.asset(paymentStatus[index]['image']),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: selectedIndex,
                      fillColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    title: Text(paymentStatus[index]['title']),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: paymentStatus.length,
              ),
      ],
    );
  }
}

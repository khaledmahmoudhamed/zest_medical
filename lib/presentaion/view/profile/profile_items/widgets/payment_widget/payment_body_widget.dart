import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/utils/show_snack_bar.dart';
import 'package:zest_medical/presentaion/view/profile/profile_items/widgets/payment_widget/payment_method_widget.dart';
import '../../../../../reusable_widgets/shared_button.dart';
import 'add_new_card_widget.dart';

class PaymentBodyWidget extends StatefulWidget {
  const PaymentBodyWidget({super.key});

  @override
  State<PaymentBodyWidget> createState() => _PaymentBodyWidgetState();
}

class _PaymentBodyWidgetState extends State<PaymentBodyWidget> {
  List<Map<String, dynamic>> paymentMethodItems = [];

  String getAsset(String title) {
    switch (title) {
      case 'Paypal':
        return "assets/paypal.svg";
      case "Master Card":
        return "assets/Mastercard logo.svg";
      case "Apple Pay":
        return "assets/apple.svg";
      case "Payoneer":
        return "assets/Payoneer logo.svg";
      case "Dana":
        return "assets/dana.svg";
      default:
        return "assets/paypal.svg";
    }
  }

  @override
  void initState() {
    loadSavedPayments();
    super.initState();
  }

  void loadSavedPayments() {
    final dynamic rawData = CacheHelper.payments!.get(ApiKeys.addPaymentMethod);
    if (rawData != null) {
      paymentMethodItems = List<dynamic>.from(rawData).map((element) {
        return Map<String, dynamic>.from(element as Map);
      }).toList();
    } else {
      paymentMethodItems = [
        {
          "image": "assets/paypal.svg",
          "title": "PayPal",
          "subTitle": '************0212',
          'status': "Connected",
        },
      ];
    }
  }

  Future<void> savePaymentList() async {
    await CacheHelper.payments!.put(
      ApiKeys.addPaymentMethod,
      paymentMethodItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: paymentMethodItems.isEmpty
              ? Center(
                  child: Text(
                    "Add Payment Method",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                )
              : ListView.builder(
                  itemCount: paymentMethodItems.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(paymentMethodItems[index]['title']),
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (val) async {
                        setState(() {
                          paymentMethodItems.removeAt(index);
                        });
                        await savePaymentList();
                        ShowMessageHandler.showSnackBar(
                          context,
                          message: "Card removed successfully",
                          isError: false,
                        );
                      },

                      child: PaymentMethodWidget(
                        key: ValueKey(paymentMethodItems[index]['title']),
                        image: paymentMethodItems[index]['image'],
                        title: paymentMethodItems[index]['title'],
                        subTitle: paymentMethodItems[index]['cardNumber'],
                        status: paymentMethodItems[index]['status'],
                        onTap: () {
                          ShowMessageHandler.showAppDialog(
                            context: context,
                            content: "Are you sure that completing payment?",
                            title: "Payment",
                            cancel: "No",
                            ok: "Yes",
                            okColor: Colors.blue,
                            cancelColor: Colors.red,
                            onPressed: () {
                              Navigator.pop(context);
                              ShowMessageHandler.showSuccessDialog(
                                context,
                                "",
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          child: SharedButton(
            onTap: () async {
              final result = await showModalBottomSheet<Map<String, dynamic>>(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => AddCardBottomSheet(),
              );
              if (result != null) {
                setState(() {
                  paymentMethodItems.add({
                    "image": getAsset(result['title']),
                    "title": result['title'],
                    "cardNumber":
                        "************${result['cardNumber']!.substring(result['cardNumber'].length - 4)}",
                    "status": "Connected",
                  });
                });
              }
              await savePaymentList();
            },
            widget: Text(
              "Add New",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

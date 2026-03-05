import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/utils/show_snack_bar.dart';
import '../../../../../reusable_widgets/shared_button.dart';
import '../personal_info_widget/personal_info_content_widget.dart';

class AddCardBottomSheet extends StatefulWidget {
  const AddCardBottomSheet({super.key});

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _cardNumberController = TextEditingController();
  final List<String> paymentTitles = [
    'PayPal',
    'Master Card',
    'Apple Pay',
    'Payoneer',
    'Dana',
  ];
  String? selectedTitle;
  final List<Map<String, dynamic>> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
        top: 3.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 2.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.sp)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "Link New Card",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            PersonalInfoContentWidget(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "* required";
                }
                if (val.length != 16) {
                  return "* Length is 16";
                }
                return null;
              },
              inputFormatters: [LengthLimitingTextInputFormatter(16)],
              maxLength: 16,

              labelText: 'Card Number',
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 2.h),

            DropdownButtonFormField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "* required";
                }
                return null;
              },
              value: selectedTitle,
              decoration: InputDecoration(
                labelText: "Select Payment Method",
                prefixIcon: const Icon(
                  Icons.payment_rounded,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
              items: paymentTitles.map((title) {
                return DropdownMenuItem(value: title, child: Text(title));
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedTitle = val;
                });
              },
            ),
            SizedBox(height: 4.h),
            SharedButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, {
                    "title": selectedTitle,
                    "cardNumber": _cardNumberController.text,
                  });
                }
              },
              widget: Text(
                "Link Account",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

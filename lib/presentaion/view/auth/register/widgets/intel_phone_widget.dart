import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sizer/sizer.dart';

class IntelPhoneWidget extends StatelessWidget {
  const IntelPhoneWidget({
    super.key,
    this.validator,
    required this.controller,
    this.errorText,
  });

  final String? Function(PhoneNumber?)? validator;
  final String? errorText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      initialCountryCode: 'EG', // Set default to Egypt for your VCare app
      controller: controller,
      onChanged: (phone) {
        controller.text = phone.number;
        print(phone.completeNumber); // What you send to the API
      },
    );
  }
}

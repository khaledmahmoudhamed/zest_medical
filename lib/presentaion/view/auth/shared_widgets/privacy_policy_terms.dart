import 'package:flutter/material.dart';

class PrivacyPolicySection extends StatelessWidget {
  const PrivacyPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By logging, you agree to our",
                  style: TextStyle(color: Colors.black45),
                ),
                TextSpan(
                  text: " Terms & Conditions",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(color: Colors.black45),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

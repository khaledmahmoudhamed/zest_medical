import 'package:flutter/material.dart';
import '../../../../reusable_widgets/bottom_indicator.dart';
import '../widgets/preferedSizedWidget.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomIndicator(),
      appBar: PreferredSizedWidget(text: "My Appointments"),
    );
  }
}

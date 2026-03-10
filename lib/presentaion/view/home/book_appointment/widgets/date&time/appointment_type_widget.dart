import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class AppointmentTypeWidget extends StatefulWidget {
  const AppointmentTypeWidget({super.key});

  @override
  State<AppointmentTypeWidget> createState() => _AppointmentTypeWidgetState();
}

class _AppointmentTypeWidgetState extends State<AppointmentTypeWidget> {
  final List<Map<String, dynamic>> appointmentTypes = [
    {"icon": Icon(Icons.person, color: Colors.blue), "title": "In Person"},
    {
      "icon": Icon(Icons.video_camera_back_outlined, color: Colors.green),
      "title": "Video Call",
    },
    {"icon": Icon(Icons.phone, color: Colors.red), "title": "Phone Call"},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              setState(() {
                selectedIndex = index;
              });
              await CacheHelper.user!.put(
                ApiKeys.userBookingType,
                appointmentTypes[index]['title'],
              );
            },
            leading: appointmentTypes[index]['icon'],
            title: Text(appointmentTypes[index]['title']),
            trailing: Radio<int>(
              value: index,
              activeColor: Colors.blue,
              groupValue: selectedIndex,
              fillColor: WidgetStatePropertyAll(Colors.blue),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Divider(),
          );
        },
        itemCount: appointmentTypes.length,
      ),
    );
  }
}

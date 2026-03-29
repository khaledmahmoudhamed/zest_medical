import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';

class NotificationContentWidget extends StatelessWidget {
  NotificationContentWidget({super.key});

  final List<dynamic> notificationItems = [
    {'title': "Notification from DocNow"},
    {'title': "Sound"},
    {'title': "Vibrate"},
    {'title': "App Updates"},
    {'title': "Special Offers"},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIconCubit, ToggleIconState>(
      builder: (BuildContext context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final switchState = state.toggleNotificationSwitch[index] ?? false;
            return ListTile(
              title: Text(notificationItems[index]['title']),
              trailing: InkWell(
                onTap: () {},
                child: Switch(
                  value: switchState,
                  onChanged: (val) {
                    context.read<ToggleIconCubit>().toggleNotificationSwitch(
                      index,
                    );
                  },
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.grey[200], thickness: 0.5.h);
          },
          itemCount: notificationItems.length,
        );
      },
    );
  }
}

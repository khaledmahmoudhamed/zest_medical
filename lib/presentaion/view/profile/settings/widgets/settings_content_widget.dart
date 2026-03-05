import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/utils/app_router.dart';

import '../../../../../../core/utils/show_snack_bar.dart';

class SettingsContentWidget extends StatelessWidget {
  SettingsContentWidget({super.key});

  final List<dynamic> settingsItem = [
    {
      "icon": Icon(Icons.notifications),
      'title': "Notification",
      "route": AppRouter.notification,
    },
    {
      "icon": Icon(Icons.question_answer_rounded),
      'title': "FAQ",
      'route': AppRouter.faq,
    },
    {
      "icon": Icon(Icons.lock_clock_rounded),
      'title': "Security",
      "route": AppRouter.security,
    },
    {
      "icon": Icon(Icons.g_translate_sharp),
      'title': "Language",
      "route": AppRouter.language,
    },
    {"icon": Icon(Icons.logout_outlined, color: Colors.red), 'title': "Logout"},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            if (settingsItem[index]['title'] == "Logout") {
              ShowMessageHandler.showAppDialog(
                onPressed: () async {
                  ShowMessageHandler.showSnackBar(
                    context,
                    message: "You are Logged Successfully",
                  );
                  Navigator.pop(context);
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.login,
                    (route) => false,
                  );
                  CacheHelper.user!.delete(ApiKeys.token);
                },
                context: context,
                content: "Are You Sure You Want Log Out",
                title: "Log out",
                cancel: "Cancel",
                ok: "Ok",
              );
            } else {
              Navigator.pushNamed(context, settingsItem[index]['route']);
            }
          },
          leading: settingsItem[index]['icon'],
          title: Text(
            settingsItem[index]['title'],
            style: TextStyle(
              color: settingsItem[index]['title'] == "Logout"
                  ? Colors.red
                  : Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey[200], thickness: 0.5.h);
      },
      itemCount: settingsItem.length,
    );
  }
}

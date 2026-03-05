import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/utils/app_router.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_cubit.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';

class SecurityContentWidget extends StatelessWidget {
  SecurityContentWidget({super.key});

  final List<dynamic> securityItems = [
    {'title': "Remember password"},
    {'title': "Face ID"},
    {'title': "PIN"},
    {'title': "Google Authenticator"},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIconCubit, ToggleIconState>(
      builder: (BuildContext context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final switchState = state.toggleSecuritySwitch[index] ?? false;
            return ListTile(
              title: Text(securityItems[index]['title']),
              trailing: securityItems[index]['title'] == "Google Authenticator"
                  ? InkWell(
                      onTap: () {},
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  : Switch(
                      value: switchState,
                      onChanged: (val) {
                        context.read<ToggleIconCubit>().toggleSecuritySwitches(
                          index,
                        );
                      },
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.grey[200], thickness: 0.5.h);
          },
          itemCount: securityItems.length,
        );
      },
    );
  }
}

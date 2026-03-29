import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> history = List<String>.from(
      CacheHelper.recentSearch!.get("recent", defaultValue: <String>[]),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Search",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            TextButton(
              onPressed: () {
                CacheHelper.recentSearch!.put("recent", []);
                setState(() {});
              },
              child: Text(
                "Clear All History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        if (history.isEmpty)
          Center(
            child: Text(
              "No recent searches",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: Icon(Icons.access_time_rounded),
                title: Text(history[index]),
                trailing: Icon(Icons.close),
              );
            },
          ),
      ],
    );
  }
}

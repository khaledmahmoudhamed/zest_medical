import 'package:flutter/material.dart';

import '../../profile/profile_items/widgets/preferedSizedWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSizedWidget(text: "Search"),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Search ddd", style: TextStyle(color: Colors.blue)),
      ),
    );
  }
}

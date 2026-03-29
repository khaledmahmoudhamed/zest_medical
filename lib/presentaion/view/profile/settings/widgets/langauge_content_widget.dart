import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/presentaion/reusable_widgets/reusable_text_form_filed.dart';

class LanguageContentWidget extends StatefulWidget {
  LanguageContentWidget({super.key});

  @override
  State<LanguageContentWidget> createState() => _LanguageContentWidgetState();
}

class _LanguageContentWidgetState extends State<LanguageContentWidget> {
  final controller = TextEditingController();

  final List<String> allLanguages = [
    "Arabic",
    "English",
    "French",
    "Ghanaian",
    "Indonesian",
    "Indian",
    "Italian",
    "Japanese",
    "Russian",
  ];

  List<String> filteredLanguage = [];

  String selectedLanguage = "English";

  @override
  void initState() {
    filteredLanguage = allLanguages;
    super.initState();
  }

  String currentQuery = '';
  void filteredSearch(String query) {
    filteredLanguage = allLanguages
        .where((e) => e.toLowerCase().contains(query))
        .toList();
    currentQuery = query;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Column(
        children: [
          ReusableTextFormField(
            onChanged: (val) {
              setState(() {
                filteredSearch(val);
              });
              print("============== $currentQuery");
            },
            controller: controller,
            obscureText: false,
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.sp),
            ),
            fillColor: Colors.blueGrey[50],
            filled: true,
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final lang = filteredLanguage[index];
                return RadioListTile<String>(
                  value: lang,
                  groupValue: selectedLanguage,
                  title: Text(
                    currentQuery.isEmpty ? allLanguages[index] : lang,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  controlAffinity:
                      ListTileControlAffinity.trailing, // Radio on the right
                  activeColor: const Color(0xff247CFF),
                  onChanged: (String? value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.grey[200], thickness: 0.5.h);
              },
              itemCount: currentQuery.isEmpty
                  ? allLanguages.length
                  : filteredLanguage.length,
            ),
          ),
        ],
      ),
    );
  }
}

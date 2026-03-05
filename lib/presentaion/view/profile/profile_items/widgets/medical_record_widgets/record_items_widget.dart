import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecordItemsWidget extends StatelessWidget {
  const RecordItemsWidget({
    super.key,
    required this.month,
    required this.date,
    required this.title,
    this.redBloodCells,
    this.hemoglobin,
    this.hematocrit,
    this.whiteBloodCells,
  });

  Widget _buildSubDetail(String label, String value) {
    return Text(
      "$label : $value",
      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
    );
  }

  final String month;
  final String date;
  final String title;
  final String? redBloodCells;
  final String? hemoglobin;
  final String? hematocrit;
  final String? whiteBloodCells;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, left: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(color: Colors.grey, fontSize: 18.sp),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    if (redBloodCells != null) ...[
                      _buildSubDetail("red blood cell", redBloodCells!),
                      _buildSubDetail("hemoglobin", hemoglobin!),
                      _buildSubDetail("hematocrit", hematocrit!),
                      _buildSubDetail("white blood cells", whiteBloodCells!),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';

import '../../../../../core/constants/colors.dart';

class ShowMapSection extends StatelessWidget {
  const ShowMapSection({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(40.7128, -74.0060), // Default to Cairo
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.zest.medical',
          ),
          // Add a Marker for the Clinic/Doctor location
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(40.7128, -74.0060),
                width: 40,
                height: 40,
                child: Icon(
                  Icons.location_on,
                  color: AppColors.blueColor,
                  size: 30.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

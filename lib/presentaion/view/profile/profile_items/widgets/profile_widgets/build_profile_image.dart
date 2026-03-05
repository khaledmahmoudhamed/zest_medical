import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';
import '../../../../../reusable_widgets/edit_icon_widget.dart';

class BuildProfileImage extends StatefulWidget {
  const BuildProfileImage({super.key});

  @override
  State<BuildProfileImage> createState() => _BuildProfileImageState();
}

class _BuildProfileImageState extends State<BuildProfileImage> {
  @override
  Widget build(BuildContext context) {
    final String? imagePath = CacheHelper.user!.get(ApiKeys.userImage);

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 18.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 17.w,
              backgroundColor: Colors.grey[200],
              child: imagePath != null
                  ? ClipOval(
                      child: Image.file(
                        File(imagePath),
                        width: 34.w,
                        height: 34.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SvgPicture.asset("assets/profile.svg"),
            ),
          ),
          Positioned(
            bottom: 1.h,
            right: 1.w,
            child: EditIconWidget(
              onTap: () {
                pickImage();
              },
            ),
          ),
        ],
      ),
    );
  }

  File? file;

  final pick = ImagePicker();

  Future<void> pickImage() async {
    final image = await pick.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
      await CacheHelper.user!.put(ApiKeys.userImage, image.path);
    }
  }
}

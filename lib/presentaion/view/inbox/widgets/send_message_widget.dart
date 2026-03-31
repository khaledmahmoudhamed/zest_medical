import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../../reusable_widgets/reusable_text_form_filed.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({super.key});

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isEmojiVisible = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(
          () => isEmojiVisible = false,
        ); // Hide emojis when keyboard opens
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: 15.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ReusableTextFormField(
                    focusNode: focusNode,
                    controller: controller,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        focusNode.unfocus(); // Hide keyboard
                        setState(() => isEmojiVisible = !isEmojiVisible);
                      },
                      child: Icon(
                        isEmojiVisible
                            ? Icons.keyboard
                            : Icons.emoji_emotions_outlined,
                      ),
                    ),
                    hintText: "Type a message ....",
                    suffixIcon: InkWell(
                      onTap: () {
                        context.read<DoctorCubit>().openGallery();
                        setState(() {});
                      },
                      child: Icon(Icons.camera_alt_rounded),
                    ),
                    obscureText: false,
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () {
                    context.read<DoctorCubit>().sendMessage(controller.text);

                    controller.clear();
                  },
                  child: SvgPicture.asset('assets/sender.svg'),
                ),
              ],
            ),
          ),
        ),
        if (isEmojiVisible)
          SizedBox(
            height: 30.h,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                controller.text = controller.text + emoji.emoji;
              },
              config: Config(
                height: 30.h,
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  // This replaces the old 'columns' and 'emojiSizeMax'
                  columns: 7,
                  emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                ),
                categoryViewConfig: const CategoryViewConfig(
                  backspaceColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  iconColorSelected: Colors.blue,
                ),
                bottomActionBarConfig: const BottomActionBarConfig(
                  enabled:
                      false, // Set to true if you want the search/backspace bar at the bottom
                ),
                searchViewConfig: const SearchViewConfig(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

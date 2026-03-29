import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';

import '../../../../data/models/user_model/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: message.isMe ? Radius.zero : Radius.circular(12),
            topLeft: message.isMe ? Radius.circular(12) : Radius.zero,
            bottomLeft: Radius.circular(12.sp),
            bottomRight: Radius.circular(12.sp),
          ),
        ),
        child: message.isImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Image.file(
                  File(message.text),
                  fit: BoxFit.cover,
                  width: 60.w,
                  height: 25.h,
                ),
              )
            : Text(
                message.text,
                style: TextStyle(
                  color: message.isMe ? Colors.white : Colors.black,
                ),
              ),
      ),
    );
  }
}

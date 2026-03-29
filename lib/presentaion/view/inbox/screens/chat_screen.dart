import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import '../../../../logic/doctor_cubit/doctor_cubit.dart';
import '../../../../logic/doctor_cubit/doctor_state.dart';
import '../../profile/profile_items/widgets/preferedSizedWidget.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/send_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.doctors});
  final Doctors doctors;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[50],

      appBar: PreferredSizedWidget(
        text: widget.doctors.name,
        isActionRequired: true,
        actionIcon: InkWell(onTap: () {}, child: Icon(Icons.video_camera_back)),
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          final messages = context.read<DoctorCubit>().chatMessages;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true, // Newest messages at the bottom
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                      ChatBubble(message: messages[index]),
                ),
              ),
              SendMessageWidget(),
            ],
          );
        },
      ),
    );
  }
}

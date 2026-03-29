import 'package:hive/hive.dart';
part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final bool isMe;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  final bool isImage;

  MessageModel({
    required this.dateTime,
    required this.text,
    required this.isMe,
    required this.isImage,
  });
}

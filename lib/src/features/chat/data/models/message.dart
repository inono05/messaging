import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';

class Message extends MessageEntity {
  Message({required super.id, required super.text, required super.createdAt, required super.isMe});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
      isMe: json['isMe'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'createdAt': createdAt.toIso8601String(), 'isMe': isMe};
  }
}

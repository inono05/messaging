import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';

class Message extends MessageEntity {
  @override
  final String? imagePath;

  Message({
    required super.id,
    required super.text,
    required super.createdAt,
    required super.isMe,
    this.imagePath,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
      isMe: json['isMe'] as bool,
      imagePath: json['imagePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'isMe': isMe,
      'imagePath': imagePath,
    };
  }
}

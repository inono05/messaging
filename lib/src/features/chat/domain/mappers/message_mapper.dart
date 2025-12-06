import 'package:messaging/src/features/chat/data/models/hive_model_message.dart';
import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';

class MessageMapper {
  static HiveModelMessage toHive(MessageEntity e) => HiveModelMessage(
    id: e.id,
    text: e.text,
    createdAtIso: e.createdAt.toIso8601String(),
    isMe: e.isMe,
    imagePath: e.imagePath,
  );

  static MessageEntity fromHive(HiveModelMessage m) => MessageEntity(
    id: m.id,
    text: m.text,
    createdAt: DateTime.parse(m.createdAtIso),
    isMe: m.isMe,
    imagePath: m.imagePath,
  );
}

import 'dart:math';

import 'package:messaging/src/features/chat/data/datasources/hive/hive_datasource.dart';
import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';
import 'package:messaging/src/features/chat/domain/mappers/message_mapper.dart';
import 'package:messaging/src/features/chat/domain/repositories/message_repository.dart';

class MessageRepository implements IMessageRepository {
  final HiveDatasource _hiveSource;

  MessageRepository(this._hiveSource);
  @override
  Future<MessageEntity> generateAutoReply() async {
    final List<String> replies = [
      "Thank you for your message!",
      "Got it, I'll check and get back to you.",
      "Could you please clarify?",
      "Noted.",
    ];
    replies.shuffle(Random());
    final text = replies.first;
    return MessageEntity(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: text,
      createdAt: DateTime.now(),
      isMe: false,
    );
  }

  @override
  Future<List<MessageEntity>> loadMessages() async {
    final messagesFromHive = await _hiveSource.getMessages();
    return messagesFromHive.map((m) => MessageMapper.fromHive(m)).toList();
  }

  @override
  Future<void> saveMessages(List<MessageEntity> messages) async {
    final messagesToHive = messages.map((m) => MessageMapper.toHive(m)).toList();
    await _hiveSource.save(messagesToHive);
  }
}

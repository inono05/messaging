import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<List<MessageEntity>> loadMessages();
  Future<void> saveMessages(List<MessageEntity> messages);
  Future<MessageEntity> generateAutoReply();
}

import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class UcSendMessage {
  final MessageRepository _repository;
  UcSendMessage(this._repository);
  Future<List<MessageEntity>> call(List<MessageEntity> messages, String text) async {
    final message = MessageEntity(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: text,
      createdAt: DateTime.now(),
      isMe: true,
    );
    final updated = [...messages, message];
    await _repository.saveMessages(updated);
    return updated;
  }
}

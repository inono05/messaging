import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class UcAutoReply {
  final IMessageRepository _repository;
  UcAutoReply(this._repository);
  Future<List<MessageEntity>> call(List<MessageEntity> messages) async {
    final reply = await _repository.generateAutoReply();
    final updated = [...messages, reply];
    await _repository.saveMessages(updated);
    return updated;
  }
}

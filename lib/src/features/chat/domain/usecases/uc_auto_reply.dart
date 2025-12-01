import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class UcAutoReply {
  final MessageRepository _repository;
  UcAutoReply(this._repository);
  Future<List<MessageEntity>> call(List<MessageEntity> replies) async {
    final reply = await _repository.generateAutoReply();
    final updated = [...replies, reply];
    await _repository.saveMessages(updated);
    return updated;
  }
}

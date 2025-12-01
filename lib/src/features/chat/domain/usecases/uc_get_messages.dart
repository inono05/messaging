import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class UcGetMessages {
  final MessageRepository _repository;
  UcGetMessages(this._repository);

  Future<List<MessageEntity>> call() async => _repository.loadMessages();
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_auto_reply.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_get_messages.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_send_message.dart';

class ChatController extends StateNotifier<AsyncValue<List<MessageEntity>>> {
  late final UcGetMessages ucGetMessage;
  late final UcSendMessage ucSendMessage;
  late final UcAutoReply ucAutoReply;

  ChatController({
    required this.ucAutoReply,
    required this.ucSendMessage,
    required this.ucGetMessage,
  }) : super(const AsyncLoading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncLoading();
    final messages = await ucGetMessage();
    state = AsyncData(messages);
  }

  Future<void> send(String text) async {
    final messages = state.value ?? [];
    final updated = await ucSendMessage(messages, text: text);

    Future.delayed(const Duration(seconds: 1), () async {
      final afterReply = await ucAutoReply(updated);
      state = AsyncData(afterReply);
    });
  }

  Future<void> sendImage(String imagePath) async {
    final messages = state.value ?? [];
    final updated = await ucSendMessage(messages, imagePath: imagePath);

    Future.delayed(const Duration(seconds: 1), () async {
      final afterReply = await ucAutoReply(updated);
      state = AsyncData(afterReply);
    });
  }
}

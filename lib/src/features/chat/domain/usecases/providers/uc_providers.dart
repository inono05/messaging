import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messaging/src/features/chat/domain/repositories/providers/repositories_providers.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_auto_reply.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_get_messages.dart';
import 'package:messaging/src/features/chat/domain/usecases/uc_send_message.dart';

final sendMessageProvider = Provider((ref) => UcSendMessage(ref.watch(messageRepositoryProvider)));
final getMessageProvider = Provider((ref) => UcGetMessages(ref.watch(messageRepositoryProvider)));
final autoReplyProvider = Provider((ref) => UcAutoReply(ref.watch(messageRepositoryProvider)));

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:messaging/src/features/chat/domain/usecases/providers/uc_providers.dart';
import 'package:messaging/src/features/chat/presentation/controllers/chat_controller.dart';

final chatProvider = StateNotifierProvider<ChatController, AsyncValue<List>>(
  (ref) => ChatController(
    ucAutoReply: ref.watch(autoReplyProvider),
    ucSendMessage: ref.watch(sendMessageProvider),
    ucGetMessage: ref.watch(getMessageProvider),
  ),
);

final cameraImageProvider = StateProvider<File?>((ref) => null);
final galleryImageProvider = StateProvider<File?>((ref) => null);

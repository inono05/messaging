import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:messaging/src/features/chat/presentation/components/message_bubble.dart';
import 'package:messaging/src/features/chat/presentation/providers/chat_provider.dart';
import 'package:messaging/src/shared/shared.dart';

import '../../../../core/forms/app_form.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatController = ref.read(chatProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: AppText(title: "Messages")),
      body: chatState.when(
        data: (messages) {
          return Column(
            children: [
              ListView.builder(
                itemCount: messages.length,
                itemBuilder: (_, i) => MessageBubble(message: messages.elementAt(i)),
              ).expanded(),
              Row(
                children: [
                  AppField(isFilled: false, controller: textController, onChanged: (value) {}).expanded(),
                  IconButton(
                    onPressed: () {
                      log(textController.text);
                      chatController.send(textController.text);
                      textController.clear();
                    },
                    icon: Icon(IconlyLight.send, color: context.primary),
                  ),
                ],
              ),
              gapH50,
            ],
          );
        },
        error: (e, _) => AppAlerts.error(message: e.toString()),
        loading: () => SpinKitChasingDots(color: context.primary).toCenter(),
      ),
    );
  }
}

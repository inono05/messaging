import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messaging/src/features/chat/domain/entities/message_entity.dart';
import 'package:messaging/src/shared/shared.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final time = DateFormat("HH:mm").format(message.createdAt);
    return Align(
      alignment: isMe ? .centerRight : .centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.p12),
        decoration: BoxDecoration(
          color: isMe ? context.primary : Colors.grey.shade300,
          borderRadius: .circular(AppSize.p12),
        ),
        child: Column(
          crossAxisAlignment: isMe ? .end : .start,
          children: [
            AppText(title: message.text, color: isMe ? Colors.white : Colors.black),
            gapH4,
            AppText.h5(title: time, color: isMe ? Colors.white70 : Colors.black54),
          ],
        ).paddingAll(AppSize.p12),
      ).paddingAll(AppSize.p8),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:messaging/src/features/chat/presentation/components/message_bubble.dart';
import 'package:messaging/src/features/chat/presentation/providers/chat_provider.dart';
import 'package:messaging/src/shared/shared.dart';

import '../../../../core/forms/app_form.dart';
import '../components/media_modal.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final textController = TextEditingController();
  late File? pathImage;
  final ScrollController _scrollController = ScrollController();

  void _scrollToLatest({bool animate = true}) {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position.maxScrollExtent + 700;
    if (animate) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatController = ref.read(chatProvider.notifier);
    final cameraImage = ref.watch(cameraImageProvider);
    final galleryImage = ref.watch(galleryImageProvider);

    //listen to scroll when a new message come up
    ref.listen(chatProvider, (prev, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToLatest());
    });
    return Scaffold(
      appBar: AppBar(
        title: AppText(title: "Messages"),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Iconsax.arrow_left, color: context.primary),
        ),
      ),
      body: chatState.when(
        data: (messages) {
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (_, i) => MessageBubble(message: messages.elementAt(i)),
              ).expanded(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      log(textController.text);
                      showModalBottomSheet(context: context, builder: (_) => const MediaModal());
                    },
                    icon: Icon(Iconsax.add, color: context.primary),
                  ),
                  AppField(
                    hintText: AppConstants.chatPlaceholder,
                    isFilled: false,
                    controller: textController,
                    onChanged: (value) {},
                  ).expanded(),
                  IconButton(
                    onPressed: () {
                      pathImage = cameraImage ?? galleryImage;
                      log(textController.text);
                      chatController.send(textController.text);
                      textController.clear();
                    },
                    icon: Icon(IconlyLight.send, color: context.primary),
                  ),
                ],
              ).paddingSymmetric(horizontal: AppSize.p4, vertical: AppSize.p4),
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

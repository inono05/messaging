import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/forms/app_form.dart';
import '../../../../shared/shared.dart';
import '../providers/chat_provider.dart';

class ImagePreviewScreen extends ConsumerWidget {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chatController = ref.read(chatProvider.notifier);
    final captionController = TextEditingController();
    final File? pathImage = ref.watch(cameraImageProvider) ?? ref.watch(galleryImageProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: AppText(title: "Image Preview"),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Iconsax.arrow_left, color: context.onTertiary),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(child: InteractiveViewer(child: Image.file(File(pathImage!.path)))),
            ),
            Row(
              children: [
                AppField(
                  hintText: AppConstants.chatPlaceholder,
                  isFilled: true,
                  controller: captionController,
                  onChanged: (value) {},
                ).expanded(),
                IconButton(
                  onPressed: () {
                    chatController.sendImage(pathImage.path);
                    captionController.clear();

                    context.pop();
                  },
                  icon: Icon(IconlyLight.send, color: context.onTertiary),
                ),
              ],
            ).paddingSymmetric(horizontal: AppSize.p4, vertical: AppSize.p4),
          ],
        ),
      ),
    );
  }
}

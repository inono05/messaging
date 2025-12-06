import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:messaging/src/shared/constants/app_size.dart';
import 'package:messaging/src/shared/utilities/app_helpers.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../shared/extensions/extensions.dart';
import '../providers/chat_provider.dart';
import 'media_button.dart';

class MediaModal extends ConsumerWidget {
  const MediaModal({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.p20)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        children: [
          MediaButton(
            icon: Iconsax.camera,
            label: "Camera",
            color: context.primary,
            onTap: () async {
              ref.read(cameraImageProvider.notifier).state = await AppHelpers.loadImageFromCamera();
              // ---- Safety check: widget might have been disposed while user was taking picture
              if (!context.mounted) return;
              context.pushNamed(AppRoutes.imagePreview.name);
              context.pop();
            },
          ),
          MediaButton(
            icon: Iconsax.picture_frame,
            label: "Gallery",
            color: context.primary,
            onTap: () async {
              ref.read(galleryImageProvider.notifier).state =
                  await AppHelpers.loadImageFromGallery();
              // ---- Safety check: widget might have been disposed while user was taking picture
              if (!context.mounted) return;
              context.pushNamed(AppRoutes.imagePreview.name);
              context.pop();
            },
          ),
        ],
      ),
    ).paddingAll(AppSize.p20);
  }
}

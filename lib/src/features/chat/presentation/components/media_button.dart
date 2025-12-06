import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class MediaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const MediaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(icon, color: color),
        ),
        gapH8,
        AppText(title: label),
      ],
    );
  }
}

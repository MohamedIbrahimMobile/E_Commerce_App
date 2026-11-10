import 'package:flutter/material.dart';

class AnnouncementBanner extends StatelessWidget {
  const AnnouncementBanner({
    super.key,
    required this.imagePath,
    this.onTap,
    this.height = 150,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
  });

  final String imagePath;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Image.asset(
            imagePath,
            fit: fit,
            errorBuilder: (context, error, stackTrace) => const ColoredBox(
              color: Color(0xFFE9EEF5),
              child: Center(child: Icon(Icons.image_not_supported_outlined)),
            ),
          ),
        ),
      ),
    );
  }
}

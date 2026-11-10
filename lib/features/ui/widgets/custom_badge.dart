import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.primary30Opacity,
    this.textColor = AppColors.primaryColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.borderRadius = 8,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: (textStyle ?? AppStyles.regular12Text).copyWith(
            color: textColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

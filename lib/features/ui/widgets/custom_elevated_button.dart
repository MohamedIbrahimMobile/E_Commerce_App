import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textStyle,
    this.width,
    this.height = 56,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.leading,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget? leading;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.65),
          foregroundColor: textStyle.color,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color:
                      textStyle.color ??
                      Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 8)],
                  Text(text, style: textStyle),
                ],
              ),
      ),
    );
  }
}

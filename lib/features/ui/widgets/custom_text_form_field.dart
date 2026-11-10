import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.isPassword = false,
    this.filledColor = AppColors.whiteColor,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.borderColor = AppColors.whiteColor,
    this.focusedBorderColor,
    this.readonly = false,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
  });

  final Color? filledColor;
  final Color borderColor;
  final Color? focusedBorderColor;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? label;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool isObscureText;
  final bool isPassword;
  final TextStyle? textStyle;
  final bool readonly;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscureText;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isPassword || widget.isObscureText;
  }

  @override
  void didUpdateWidget(covariant CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPassword != widget.isPassword ||
        oldWidget.isObscureText != widget.isObscureText) {
      _isObscureText = widget.isPassword || widget.isObscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: widget.textStyle ?? AppStyles.regular14Text,
      obscureText: _isObscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      readOnly: widget.readonly,
      maxLines: widget.isPassword || widget.isObscureText ? 1 : widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.filledColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        label: widget.label,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: widget.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.5),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.isPassword) return widget.suffixIcon;

    return IconButton(
      tooltip: _isObscureText ? 'Show password' : 'Hide password',
      onPressed: () => setState(() => _isObscureText = !_isObscureText),
      icon: Icon(
        _isObscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
      ),
    );
  }
}

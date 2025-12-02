import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:messaging/src/shared/extensions/context_extension.dart';

typedef OnChanged = void Function(String value);

class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? hintText;
  final String? prefixText;
  final String? label;
  final bool isPassword;
  final bool isTextArea;
  final bool isBorderLess;
  final bool isComposed;
  final String? helperText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String? error;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? prefixStyle;
  final VoidCallback? onTap;
  final OnChanged onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool? isExpands;
  final bool? isFilled;
  final bool? autoFocus;
  final BorderSide? borderSide;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final Color? cursorColor;

  const AppField({
    super.key,
    this.controller,
    this.hintText,
    this.label,
    this.error,
    this.isPassword = false,
    this.isTextArea = false,
    this.isBorderLess = true,
    this.isComposed = true,
    this.readOnly = false,
    this.keyboardType,
    this.prefixIcon,
    this.helperText,
    this.suffixIcon,
    this.validator,
    this.initialValue,
    this.onTap,
    required this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.isExpands = false,
    this.borderSide,
    this.suffix,
    this.prefix,
    this.prefixText,
    this.maxLength,
    this.focusNode,
    this.isFilled = true,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.sentences,

    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.prefixStyle,
    this.fillColor,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    final inputStyle = context.bMedium?.copyWith(color: context.primary);
    final labelStyleDefault = context.hSmall;
    final hintStyleDefault = context.bMedium;
    final errorStyleDefault = context.hSmall;
    final prefixStyleDefault = context.bSmall;
    return TextFormField(
      style: style ?? inputStyle,
      autofocus: autoFocus!,
      textCapitalization: textCapitalization,
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      initialValue: initialValue,
      onTap: onTap,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      onChanged: (value) {
        onChanged(value);
      },
      keyboardType: keyboardType,
      textInputAction: TextInputAction.newline,
      expands: isExpands!,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: isPassword,
      focusNode: focusNode,
      cursorColor: cursorColor ?? Colors.black,
      decoration: InputDecoration(
        helperText: helperText,
        errorText: error,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? Colors.grey.shade100,
        filled: isFilled,
        prefix: prefix,
        prefixText: prefixText,
        suffix: suffix,
        labelText: label,
        hintText: hintText,
        counterText: "",
        prefixStyle: prefixStyle ?? prefixStyleDefault,
        hintStyle: hintStyle ?? hintStyleDefault,
        labelStyle: labelStyle ?? labelStyleDefault,
        errorStyle: errorStyle ?? errorStyleDefault?.copyWith(color: Colors.red),
      ),
    ).animate().fadeIn(duration: 500.ms).slide();
  }
}

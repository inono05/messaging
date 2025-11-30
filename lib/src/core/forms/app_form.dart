import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:messaging/src/shared/shared.dart';

typedef OnChanged = void Function(String value);

class AppField<T extends StateNotifier<AsyncValue<void>>>
    extends ConsumerWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String field;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? hintText;
  final String? prefixText;
  final String? labelText;
  final bool isPassword;
  final bool isTextArea;
  final bool isBorderLess;
  final bool isComposed;
  final String? helperText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String? errorText;
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

  const AppField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
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
    required this.field,
  });

  @override
  Widget build(BuildContext context, ref) {
    return TextFormField(
          style: context.hMedium?.copyWith(color: context.tertiary),
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
          cursorColor: context.secondary,
          decoration: InputDecoration(
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: context.surface,
            filled: isFilled,
            prefix: prefix,
            prefixText: prefixText,
            suffix: suffix,
            labelText: labelText,
            hintText: hintText,
            counterText: "",
            prefixStyle: context.hSmall,
            hintStyle: context.hSmall?.copyWith(
              color: context.secondary.withValues(alpha: .3),
            ),
            labelStyle: context.hMedium?.copyWith(color: context.primary),
            errorStyle: context.hSmall?.copyWith(color: context.error),
          ),
        )
        .paddingSymmetric(vertical: AppSize.p8)
        .animate()
        .fadeIn(duration: 500.ms)
        .slide();
  }
}

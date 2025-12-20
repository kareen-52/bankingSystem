import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
       
      // textDirection: TextDirection.rtl,
      // textAlign: TextAlign.right,

      controller: controller,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),

      cursorColor: colorScheme.primary,
      // cursorColor: Colors.grey,

      cursorErrorColor: Colors.red,
      mouseCursor: WidgetStateMouseCursor.textable,

      decoration: InputDecoration(
        filled: true,
        fillColor: colorScheme.surface,
        // fillColor: ColorsManager.beaverlight,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colorScheme.primary),
          // borderSide: BorderSide(color: ColorsManager.beaver, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 3),
          // borderSide: BorderSide(color: ColorsManager.beaver, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),

        errorBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.red, width: 1),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.3)),
          // borderSide: BorderSide(width: 1, color: colorScheme.onSurface.withOpacity(0.3)),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),


        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
        // hintStyle: TextStyle(color: Colors.grey),
        suffixIconColor: Colors.grey,
      ),
      
      obscureText: isObscureText ?? false,
      // style: TextStyle(
      //   fontSize: context.setSp(14),
      //   fontWeight: FontWeightHelper.medium,
      //   color: ColorsManager.darkBlue,
      // ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}

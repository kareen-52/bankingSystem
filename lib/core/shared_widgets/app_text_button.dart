
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? 16,
              ),
            ),
          ),

          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? colorScheme.primary,
          ),
          foregroundColor: WidgetStatePropertyAll(colorScheme.primary),

          // backgroundColor: WidgetStatePropertyAll(
          //   backgroundColor ?? ColorsManager.oxfordBlue,
          // ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ??12,
              vertical: verticalPadding ??12,
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(
              buttonWidth ?? double.maxFinite,
              buttonHeight ??40,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style:
              textStyle ??
              theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onPrimary,
                fontSize: 16,
              ),
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    );
  }
}

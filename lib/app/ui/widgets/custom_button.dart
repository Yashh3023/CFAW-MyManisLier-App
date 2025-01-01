import 'package:mymanislier/app/utils/helpers/exporter.dart';
import 'package:flutter/cupertino.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.alignment,
    this.buttonTextStyle,
    this.isDisabled = false,
    this.height,
    this.width,
    this.iconSpacing,
    this.isLoading = false,
    required this.text,
  });

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Alignment? alignment;
  final TextStyle? buttonTextStyle;
  final bool isDisabled;
  final double? height;
  final double? width;
  final double? iconSpacing;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.zero,
              textStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
        onPressed: isDisabled
            ? null
            : () {
                HapticFeedback.lightImpact();
                if (onPressed != null) onPressed!();
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null && iconSpacing != null)
              SizedBox(width: iconSpacing),
            if (isLoading)
              const CupertinoActivityIndicator()
            else
              Text(
                text,
                style: buttonTextStyle ??
                    Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0.sp,
                          color: isDisabled
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).colorScheme.onPrimary,
                        ),
              ),
            if (rightIcon != null && iconSpacing != null)
              SizedBox(width: iconSpacing),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}

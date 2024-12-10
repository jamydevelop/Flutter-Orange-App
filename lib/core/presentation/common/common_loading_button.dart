import 'package:flutter/material.dart';

import '../../resources/dimensions.dart' as dimensions;
import '../../utils/fading_circle_spinner.dart';
import 'common_button.dart';

class CommonLoadingButton extends StatelessWidget {
  const CommonLoadingButton({
    super.key,
    required this.text,
    this.width,
    this.isLoading = false,
    this.onPressed,
    this.buttonBackground,
    this.fontSize = 16,
    this.fontWeight,
    this.padding = const EdgeInsets.all(dimensions.regularSpacing),
    this.borderRadius = 10,
    this.loadingSize = 30,
    this.height,
    this.overlayColor,
    this.textColor,
    this.fontFamily
  });

  final double? width;
  final bool isLoading;
  final double? height;
  final String text;
  final VoidCallback? onPressed;
  final Color? buttonBackground;
  final double fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final EdgeInsets padding;
  final double borderRadius;
  final double loadingSize;
  final Color? overlayColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      backgroundColor: buttonBackground ?? Colors.orange,
      padding: padding,
      overlayColor: overlayColor,
      width: width,
      foregroundColor: textColor ?? Colors.white,
      borderRadius: borderRadius,
      text: isLoading ? null : text,
      fontSize: fontSize,
      height: height ?? 55,
      fontFamily: fontFamily ?? "Caslon",
      fontWeight: fontWeight,
      onPressed: isLoading ? null : onPressed,
      textColor: textColor,
      child: isLoading
          ? Transform.translate(
              offset: const Offset(0, 10),
              child: FadingCircleSpinner(
                size: loadingSize,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}

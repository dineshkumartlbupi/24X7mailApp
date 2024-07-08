import 'package:flutter/material.dart';

class GlobalText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLine;
  final VoidCallback? onTap;
  final bool? isTextSelectable;
  final List<Shadow>? shadows;
  final double? paddingTop, paddingBottom, paddingRight, paddingLeft;
  final TextStyle? textStyle;
  const GlobalText(
    this.text, {
    Key? key,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.textDecoration,
    this.textOverflow,
    this.fontStyle = FontStyle.normal,
    this.letterSpacing,
    this.textAlign,
    this.maxLine,
    this.onTap,
    this.isTextSelectable = false,
    this.shadows,
    this.paddingTop,
    this.paddingBottom,
    this.paddingRight,
    this.paddingLeft,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fontTextStyle = TextStyle(
      fontFamily: 'Ubuntu' ?? ' sans-serif ',
      color: color,
      height: height ?? 1.2,
      overflow: textOverflow,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      shadows: shadows,
    );
    return InkWell(
      onTap: onTap,
      child: isTextSelectable == true
          ? SelectableText(
              text,
              textAlign: textAlign,
              maxLines: maxLine,
              style: textStyle ?? fontTextStyle,
            )
          : Text(
              text,
              textAlign: textAlign,
              maxLines: maxLine,
              style: textStyle ?? fontTextStyle,
            ),
    );
  }
}

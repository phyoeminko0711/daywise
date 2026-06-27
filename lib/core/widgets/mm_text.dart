import 'package:daywise/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MmText extends StatelessWidget {
  const MmText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? Theme.of(context).textTheme.bodyLarge;
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.notoSansMyanmar(
        textStyle: baseStyle?.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}

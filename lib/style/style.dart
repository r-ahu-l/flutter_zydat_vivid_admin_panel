import 'package:flutter/material.dart';
import 'package:zydat_color_panel/style/colors.dart';

class PrimaryText extends StatelessWidget {
  final double? size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;
  final TextAlign? align;

  const PrimaryText(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.w400,
      this.color = AppColors.primary,
      this.size = 20,
      this.height = 1.3,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: align,
    );
  }
}

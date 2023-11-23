import 'package:flutter/material.dart';
import 'package:zydat_color_panel/config/responsive.dart';
import 'package:zydat_color_panel/style/colors.dart';
import 'package:zydat_color_panel/style/style.dart';

Widget buildTextField(String labelText, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PrimaryText(
        text: labelText,
        color: AppColors.iconGray,
        size: Responsive.isMobile(context) ? 11 : 14,
        fontWeight: FontWeight.w600,
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width * 0.17
            : Responsive.isTablet(context)
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter $labelText',
            hintStyle: TextStyle(
              color: AppColors.black,
              fontFamily: 'Poppins',
              fontSize: Responsive.isMobile(context) ? 12 : 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 18,
      ),
    ],
  );
}

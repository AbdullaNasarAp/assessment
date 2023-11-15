import 'package:assessment/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget text({
  required String giveText,
  double fontsize = 14,
  FontWeight fontweight = FontWeight.normal,
  Color textColor = AppColors.textBlack,
  double? textHeight,
  TextDecoration? underline,
  int? maxLine,
  TextAlign textAlignment = TextAlign.start,
}) =>
    Text(
      giveText,
      maxLines: maxLine,
      textAlign: textAlignment,
      style: textStyle(
        underline: underline,
        fontsize: fontsize,
        fontweight: fontweight,
        textColor: textColor,
        textHeight: textHeight,
      ),
    );

TextStyle textStyle(
    {FontWeight? fontweight,
    Color? textColor,
    double? textHeight,
    double? fontsize,
    TextDecoration? underline}) {
  return TextStyle(
    decoration: underline,
    color: textColor,
    fontSize: fontsize,
    fontWeight: fontweight,
    height: textHeight,
  );
}

Widget verticalSpacing(size) {
  return SizedBox(
    height: Get.height * size,
  );
}

Widget horizontalSpacing(size) {
  return SizedBox(
    width: Get.width * size,
  );
}

Column bottomNavItems(String svg, String texts, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(svg),
      text(giveText: texts, textColor: color, fontsize: 11),
    ],
  );
}

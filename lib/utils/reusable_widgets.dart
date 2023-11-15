// ignore_for_file: must_be_immutable

import 'package:assessment/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.initailVal,
      this.title,
      this.hintText,
      this.suffix,
      this.prefixIcon,
      this.prefix,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap,
      this.controller,
      this.keyboardType,
      this.maxlines = 1,
      this.obscureText = false,
      this.validator,
      this.enabled,
      this.maxlength,
      this.onChanged,
      this.prefixText,
      this.sizedBoxWidth,
      this.contentPadding,
      this.titleSize,
      this.fontWeight,
      this.radius,
      this.outLineRadius = 5,
      this.ishintneed = false,
      this.inputFormatter,
      this.label});
  bool? enabled;
  final String? title;
  final int? maxlength;
  final String? hintText;
  final String? prefixText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxlines;
  final bool obscureText;
  final String? initailVal;
  EdgeInsetsGeometry? contentPadding;
  final double? sizedBoxWidth;
  double? titleSize;
  FontWeight? fontWeight;
  double? radius;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  double? outLineRadius;
  final bool ishintneed;
  final String? label;
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != "",
          child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                children: [
                  text(
                    giveText: title ?? "",
                    fontweight: fontWeight ?? FontWeight.w400,
                    textColor: title == "nil"
                        ? Colors.white
                        : colorTheme.textTheme.bodyMedium!.color!,
                    fontsize: titleSize ?? 16,
                  ),
                  text(
                    giveText: title == "nil" ? "" : " *",
                    fontweight: fontWeight ?? FontWeight.w400,
                    textColor: Colors.red,
                    fontsize: titleSize ?? 16,
                  ),
                ],
              )),
        ),
        SizedBox(
          width: sizedBoxWidth,
          child: TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              inputFormatters: inputFormatter,
              maxLength: maxlength,
              enabled: enabled,
              initialValue: initailVal,
              keyboardType: keyboardType,
              controller: controller,
              onTap: onTap,
              readOnly: readOnly!,
              onChanged: onChanged,
              obscureText: obscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                  color: colorTheme.textTheme.titleMedium!.color!,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                prefixText: prefixText,
                focusedErrorBorder: outlineBorderWidget(outLineRadius),
                errorBorder: outlineBorderWidget(outLineRadius),
                disabledBorder: outlineBorderWidget(outLineRadius),
                enabledBorder: outlineBorderWidget(outLineRadius),
                focusedBorder: outlineBorderWidget(outLineRadius),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(),
                contentPadding: contentPadding,
                hintText: hintText ?? (ishintneed == true ? " $label" : null),
                suffix: suffix,
                prefix: prefix,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
              validator: validator,
              maxLines: maxlines),
        ),
      ],
    );
  }
}

InputBorder outlineBorderWidget(double? radius) {
  final colorTheme = Theme.of(Get.context!);
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 5),
      borderSide: BorderSide(color: colorTheme.dividerColor, width: 1));
}

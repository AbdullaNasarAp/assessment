import 'package:assessment/utils/reusable_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageUploadWidget1 extends StatelessWidget {
  const ImageUploadWidget1({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            text(
              giveText: title1,
              fontweight: FontWeight.w400,
              textColor: Colors.black,
              fontsize: 14,
            ),
            text(
              giveText: " *",
              fontweight: FontWeight.w400,
              textColor: Colors.red,
              fontsize: 14,
            ),
            text(
              giveText: title2,
              fontweight: FontWeight.w400,
              textColor: Colors.grey,
              fontsize: 14,
            ),
          ],
        ),
        Row(
            children: List.generate(
          3,
          (index) => index != 2
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset("assets/images/town.png"),
                )
              : DottedBorder(
                  color: Colors.grey,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/img.png"),
                          text(
                            giveText: "写真を追加",
                            fontweight: FontWeight.w400,
                            textColor: Colors.grey,
                            fontsize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ))
      ],
    );
  }
}

class ImageUploadWidget2 extends StatelessWidget {
  const ImageUploadWidget2({
    super.key,
    required this.title1,
    required this.title2,
    required this.img,
    required this.padding,
    required this.padding1,
    required this.padding2,
  });

  final String title1;
  final String title2;
  final String img;
  final double padding;
  final double padding1;
  final double padding2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            text(
              giveText: title1 == "nil" ? "" : title1,
              fontweight: FontWeight.w400,
              textColor: Colors.black,
              fontsize: 13,
            ),
            text(
              giveText: title2 == "nil" ? "" : " *",
              fontweight: FontWeight.w400,
              textColor: Colors.red,
              fontsize: 13,
            ),
            text(
              giveText: title2 == "nil" ? "" : title2,
              fontweight: FontWeight.w400,
              textColor: Colors.grey,
              fontsize: 13,
            ),
          ],
        ),
        Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: padding, top: padding1, bottom: padding2),
              child: Image.asset(img),
            ),
          ),
        )
      ],
    );
  }
}

List<String> food = [
  "assets/images/food0.png",
  "assets/images/food1.png",
  "assets/images/food2.png",
];

import 'package:assessment/controllers/home_controller.dart';
import 'package:assessment/utils/hex_color.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:assessment/view/stamp_detail.dart/stamp_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.controller,
    required this.index,
  });

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const StampDetailScreen()),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ], borderRadius: BorderRadius.circular(20), color: Colors.transparent),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    width: Get.width,
                    controller.tiles[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: HexColor("FF6262"),
                    ),
                    child: Center(
                      child: text(
                          giveText: controller.tiles[index].rating,
                          textColor: Colors.white,
                          fontsize: 12),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                          giveText: controller.tiles[index].title,
                          fontsize: 16),
                      verticalSpacing(.012),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 30,
                            width: Get.width / 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: HexColor("EEA840").withOpacity(0.2),
                            ),
                            child: Center(
                              child: text(
                                  giveText: controller.tiles[index].quality,
                                  textColor: HexColor("FAAA14"),
                                  fontsize: 12),
                            ),
                          ),
                          text(
                              giveText: controller.tiles[index].price,
                              fontsize: 17,
                              fontweight: FontWeight.bold)
                        ],
                      ),
                      verticalSpacing(.012),
                      text(
                        giveText: controller.tiles[index].dateTime,
                        fontsize: 12,
                      ),
                      verticalSpacing(.012),
                      text(
                        giveText: controller.tiles[index].description,
                        fontsize: 12,
                      ),
                      verticalSpacing(.012),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            giveText: controller.tiles[index].author,
                            fontsize: 12,
                            textColor: HexColor("303030").withOpacity(0.6),
                          ),
                          Obx(() => IconButton(
                                onPressed: () {
                                  controller
                                      .toggleFavorite(controller.tiles[index]);
                                },
                                icon: Icon(
                                  controller.tiles[index].isFavor.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controller.tiles[index].isFavor.value
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                ),
                                color: Colors.grey.withOpacity(
                                  0.5,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

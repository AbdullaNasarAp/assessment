import 'package:assessment/controllers/home_controller.dart';
import 'package:assessment/utils/hex_color.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:assessment/view/home/widgets/calendar_list.dart';
import 'package:assessment/view/home/widgets/home_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("1E1E1E").withOpacity(0.01),
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.all(10),
            width: Get.width * .70,
            decoration: BoxDecoration(
              color: HexColor('F7F7F7'),
              borderRadius: BorderRadius.circular(30),
            ),
            child: text(giveText: "北海道, 札幌市"),
          ),
          actions: [
            SvgPicture.asset(
              "assets/images/filter.svg",
              width: 35,
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/images/favor.svg",
                width: 30,
                height: 30,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              height: Get.height * .05,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    HexColor('FAAA14').withOpacity(0.8),
                    HexColor('FFD78D'),
                  ],
                ),
              ),
              child: Center(
                child: text(giveText: "2022年 5月 26日(木)", fontsize: 15),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Obx(
                    () {
                      final selectedDate = controller.selectedDate.value;

                      return Container(
                        color: HexColor("1E1E1E").withOpacity(0.01),
                        height: 100,
                        child: MyList(
                          onDateTap: controller.updateSelectedDate,
                          selectedDate: selectedDate,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: Get.height / 1.67,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.tiles.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 30,
                          );
                        },
                        itemBuilder: (context, index) {
                          return HomeTile(
                            controller: controller,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

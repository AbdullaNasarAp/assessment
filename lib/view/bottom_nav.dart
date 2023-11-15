import 'package:assessment/controllers/home_controller.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:assessment/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNav extends GetWidget<HomeController> {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HomeScreen(),
          Positioned(
            bottom: 20,
            right: 15,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: RawMaterialButton(
                onPressed: () {},
                child: const Icon(
                  Icons.location_on_outlined,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.grey),
          child: Obx(() => BottomNavigationBar(
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange,
                unselectedLabelStyle: textStyle(textColor: Colors.black),
                items: controller.bottomNavigationBar.map((element) {
                  return BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        element["svg"],
                        color: controller.currentIndex.value ==
                                controller.bottomNavigationBar.indexOf(element)
                            ? Colors.orange
                            : Colors.black,
                      ),
                    ),
                    label: element["title"],
                  );
                }).toList(),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        elevation: 0,
        onPressed: () {},
        child: SvgPicture.asset("assets/images/scan-line.svg"),
      ),
    );
  }
}

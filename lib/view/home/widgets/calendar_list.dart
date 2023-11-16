import 'package:assessment/controllers/home_controller.dart';
import 'package:assessment/utils/hex_color.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyList extends StatelessWidget {
  const MyList({
    super.key,
    required this.onDateTap,
    required this.selectedDate,
  });

  final void Function(DateTime) onDateTap;

  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put<HomeController>(HomeController());

    return Obx(() {
      final itemCount = (homeController.currentPage.value * 20 <= 365)
          ? homeController.currentPage.value * 20
          : 365;

      DateTime twoWeeksAgo = DateTime.now().subtract(const Duration(days: 14));
      return ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: homeController.scrollController,
        itemCount: itemCount + (homeController.isLoading.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < itemCount) {
            final dateToDisplay = twoWeeksAgo.add(Duration(days: index));
            final isDateSelected =
                homeController.isSameDate(dateToDisplay, selectedDate).value;

            homeController.japaneseDayName.value =
                homeController.getJapaneseDayName(dateToDisplay);

            return GestureDetector(
              onTap: () {
                onDateTap(dateToDisplay);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: isDateSelected ? 10 : 16,
                ),
                child: Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(
                    color: isDateSelected
                        ? HexColor('FAAA14')
                        : HexColor("1E1E1E").withOpacity(0.01),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                        giveText: homeController.japaneseDayName.value,
                        fontsize: 17.0,
                        fontweight: FontWeight.w600,
                        textColor: isDateSelected ? Colors.white : Colors.black,
                      ),
                      text(
                        giveText: '${dateToDisplay.day}',
                        fontsize: 17.0,
                        fontweight: FontWeight.bold,
                        textColor: isDateSelected ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (homeController.isLoading.value) {
            return const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else {
            return Container();
          }
        },
      );
    });
  }
}

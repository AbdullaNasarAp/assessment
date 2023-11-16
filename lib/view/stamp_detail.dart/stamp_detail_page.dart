import 'package:assessment/utils/hex_color.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StampDetailScreen extends StatelessWidget {
  const StampDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("A8B1FF"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("A8B1FF"),
        centerTitle: true,
        title:
            text(giveText: 'スタンプカード詳細', textColor: Colors.white, fontsize: 15),
        leading: IconButton(
          icon: CircleAvatar(
              radius: 20,
              backgroundColor: HexColor("949EFF"),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 16,
              )),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/minus-circle.svg"),
          )
        ],
      ),
      body: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  giveText: 'Mer キッチン',
                  fontsize: 20,
                  textColor: Colors.white,
                  fontweight: FontWeight.w600,
                ),
                RichText(
                  text: TextSpan(
                    text: '現在の獲得数',
                    style: textStyle(
                      fontsize: 14,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: ' 30 ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 26)),
                      TextSpan(text: '個'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 270.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
              ),
              items: List.generate(3, (index) {
                return buildCarouselItem();
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: Get.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                    giveText: 'スタンプ獲得履歴',
                    fontsize: 16,
                    fontweight: FontWeight.w600),
                ListView.separated(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: text(
                          giveText: '2021/11/18',
                          fontsize: 12,
                          textColor: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      subtitle: text(giveText: 'スタンプを獲得しました。', fontsize: 15),
                      trailing: text(
                        giveText: "1 個",
                        fontsize: 15,
                        fontweight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (columnIndex) {
                return buildColumn();
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (avatarIndex) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            "assets/images/medal.svg",
            height: 45,
          ),
        );
      }),
    );
  }
}

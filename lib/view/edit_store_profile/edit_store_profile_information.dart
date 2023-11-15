import 'package:assessment/utils/hex_color.dart';
import 'package:assessment/utils/reusable_widgets.dart';
import 'package:assessment/view/edit_store_profile/img_upload_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditStoreProfileScreen extends StatelessWidget {
  const EditStoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: HexColor("8C817B").withOpacity(0.1),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 17,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: text(
            giveText: "店舗プロフィール編集", fontweight: FontWeight.w500, fontsize: 16),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/images/notification.svg"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          verticalSpacing(.018),
          CustomTextFormField(
            title: "店舗名",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "Mer キッチン",
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "代表担当者名",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "林田　絵梨花",
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "店舗電話番号",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            label: "123 - 4567 8910",
            radius: 2,
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "店舗住所",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "大分県豊後高田市払田791-13",
          ),
          verticalSpacing(.018),
          Image.asset(
            "assets/images/map.png",
            fit: BoxFit.cover,
          ),
          const ImageUploadWidget1(
            title1: "店舗外観",
            title2: "（最大3枚まで）",
          ),
          Column(
            children: [
              Row(
                children: [
                  text(
                    giveText: "店舗内観",
                    fontweight: FontWeight.w400,
                    textColor: Colors.black,
                    fontsize: 13,
                  ),
                  text(
                    giveText: " *",
                    fontweight: FontWeight.w400,
                    textColor: Colors.red,
                    fontsize: 13,
                  ),
                  text(
                    giveText: "（1枚〜3枚ずつ追加してください）",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      child: Image.asset("assets/images/offices.png")),
                ),
              )
            ],
          ),
          ImageUploadWidget2(
            title1: " 料理写真",
            title2: "（1枚〜3枚ずつ追加してください）",
            img: food[0],
            padding: 15,
            padding1: 6,
            padding2: 6,
          ),
          ImageUploadWidget2(
            title1: " メニュー写真",
            title2: "（1枚〜3枚ずつ追加してください）",
            img: food[0],
            padding: 15,
            padding1: 6,
            padding2: 6,
          ),
          verticalSpacing(.018),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "店舗名",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "10:00",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text(giveText: "~", fontsize: 20),
              ),
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "nil",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "20:00",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
            ],
          ),
          verticalSpacing(.018),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "ランチ時間",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "11:00",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text(giveText: "~", fontsize: 20),
              ),
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "nil",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "15:00",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
            ],
          ),
          verticalSpacing(.018),
          Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      text(giveText: "月")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      text(giveText: "火")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      text(giveText: "水")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      text(giveText: "木")
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      text(giveText: "金")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "土")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "日")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "祝")
                    ],
                  ),
                ],
              ),
            ],
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            sizedBoxWidth: Get.width / 2,
            title: "料理カテゴリー",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "料理カテゴリー選択",
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
          ),
          verticalSpacing(.018),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "予算",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "¥ 1,000",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text(giveText: "~", fontsize: 20),
              ),
              CustomTextFormField(
                sizedBoxWidth: Get.width / 3,
                title: "nil",
                ishintneed: true,
                validator: (p0) {
                  return '';
                },
                radius: 2,
                label: "¥ 2,000",
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
            ],
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "キャッチコピー",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "美味しい！リーズナブルなオムライスランチ！",
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "座席数",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "40席",
          ),
          verticalSpacing(.018),
          Column(
            children: [
              Row(
                children: [
                  text(giveText: "喫煙席"),
                  text(giveText: " *", textColor: Colors.red),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: HexColor("EE7D42"),
                  ),
                  text(giveText: "有"),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: HexColor("EE7D42"),
                  ),
                  text(giveText: "無")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      text(giveText: "駐車場"),
                      text(giveText: " *", textColor: Colors.red),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "有"),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "無")
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      text(giveText: "来店プレゼント"),
                      text(giveText: " *", textColor: Colors.red),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "有（最大３枚まで）"),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: HexColor("EE7D42"),
                      ),
                      text(giveText: "無")
                    ],
                  ),
                ],
              ),
              ImageUploadWidget2(
                title1: "",
                title2: "",
                img: food[0],
                padding: 15,
                padding1: 6,
                padding2: 6,
              )
            ],
          ),
          verticalSpacing(.018),
          CustomTextFormField(
            title: "来店プレゼント名",
            ishintneed: true,
            validator: (p0) {
              return '';
            },
            radius: 2,
            label: "いちごクリームアイスクリーム, ジュース",
          ),
          verticalSpacing(.018),
          Container(
            width: double.infinity,
            height: 60,
            decoration:
                BoxDecoration(color: HexColor("EE7D42").withOpacity(0.2)),
            child: RawMaterialButton(
              onPressed: () {},
              child: text(giveText: "編集を保存", textColor: Colors.white),
            ),
          ),
          verticalSpacing(0.07)
        ],
      ),
    );
  }
}

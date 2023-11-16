import 'package:assessment/model/home_tile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  RxInt currentPage = 1.obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString japaneseDayName = ''.obs;
  RxList<HomeTileModel> favoritesList = <HomeTileModel>[].obs;

  Future<void> loadMoreItems() async {
    if (currentPage.value * 20 >= 365) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    currentPage.value++;
    isLoading.value = false;
  }

  @override
  void onInit() {
    double initialOffset = 1000.0;
    scrollController = ScrollController(initialScrollOffset: initialOffset);
    scrollController.addListener(() {
      if (!scrollController.hasClients) {
        return;
      }
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading.value) {
        loadMoreItems();
      }
    });

    super.onInit();
  }

  void toggleFavorite(HomeTileModel tile) {
    bool isFavorited = favoritesList.contains(tile);

    if (isFavorited) {
      favoritesList.remove(tile);
    } else {
      favoritesList.add(tile);
    }
  }

  RxBool isSameDate(DateTime date1, DateTime date2) {
    final result = RxBool(
      date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day,
    );

    return result;
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  String getJapaneseDayName(DateTime date) {
    initializeDateFormatting('ja', null);
    String dayName = DateFormat('E', 'ja').format(date);
    return dayName;
  }

  final RxInt currentIndex = 0.obs;

  final List<Map<String, dynamic>> bottomNavigationBar = [
    {"svg": "assets/images/search.svg", "title": "さがす"},
    {"svg": "assets/images/officebag.svg", "title": "お仕事"},
    {"svg": "assets/images/dot.svg", "title": "お仕事"},
    {"svg": "assets/images/chat.svg", "title": "チャット"},
    {"svg": "assets/images/person.svg", "title": "マイページ"},
  ];

  List<HomeTileModel> tiles = [
    HomeTileModel(
      id: "01",
      image: "assets/images/tile1.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "02",
      image: "assets/images/tile2.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "03",
      image: "assets/images/tile3.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "04",
      image: "assets/images/tile4.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "05",
      image: "assets/images/tile1.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "06",
      image: "assets/images/tile2.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "07",
      image: "assets/images/tile3.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
    HomeTileModel(
      id: "08",
      image: "assets/images/tile4.png",
      title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
      rating: "本日まで",
      quality: "介護付き有料老人ホーム",
      dateTime: "5月 31日（水）08 : 00 ~ 17 : 00",
      description: "北海道札幌市東雲町3丁目916番地17号\n交通費 300円",
      price: "¥ 6,000",
      author: "住宅型有料老人ホームひまわり倶楽部",
      isFavor: false.obs,
    ),
  ];
}

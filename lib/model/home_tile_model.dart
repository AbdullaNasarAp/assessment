import 'package:get/get.dart';

class HomeTileModel {
  final String id;
  final String image;
  final String title;
  final String rating;
  final String quality;
  final String dateTime;
  final String description;
  final String price;
  final String author;
  RxBool isFavor = false.obs;

  HomeTileModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.rating,
      required this.quality,
      required this.dateTime,
      required this.description,
      required this.price,
      required this.author,
      required this.isFavor});
}

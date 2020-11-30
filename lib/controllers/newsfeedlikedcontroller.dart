import 'package:SocMedApp/models/newsfeedliked.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:get/get.dart';

class NewsFeedLikedController extends GetxController {
  Rx<List<NewsFeedLiked>> newsFeedLikedList = Rx<List<NewsFeedLiked>>();

  List<NewsFeedLiked> get newsFeedLiked => newsFeedLikedList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    newsFeedLikedList.bindStream(Database().newsFeedItemIdStream());
  }
}

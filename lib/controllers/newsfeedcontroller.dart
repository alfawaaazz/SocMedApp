import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/models/newsfeed.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:get/get.dart';

class NewsFeedController extends GetxController {
  Rx<List<NewsFeedModel>> newsFeedList = Rx<List<NewsFeedModel>>();

  List<NewsFeedModel> get newsFeed => newsFeedList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    newsFeedList.bindStream(Database().newsFeedStream());
  }

  void printValues() {
    print("UID: ${Get.find<UserController>().user.id}");
    newsFeedList.bindStream(Database().newsFeedStream());
    print("Is List Null? : ${newsFeed.isNull}");
  }
}

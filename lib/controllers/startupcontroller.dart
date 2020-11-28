import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:get/get.dart';

class StartUpController extends GetxController {
  WeatherController weatherCont =
      Get.put<WeatherController>(WeatherController());

  Rx<bool> loadingValue = Rx<bool>();

  bool get loadingbool => this.loadingValue.value;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await weatherCont.getPosition();
    await weatherCont.getWeather(
        weatherCont.pos.value.lat, weatherCont.pos.value.lon);
    Get.find<UserController>().user =
        await Database().getUser(Get.find<AuthController>().user.uid);
    toggleLoadingValue();
  }

  void toggleLoadingValue() {
    print("Toggle Loading Value");
    // loadingValue.update((value) {
    //   value = true;
    // });
    if (loadingbool == null || loadingbool == false) {
      loadingValue.value = true;
    } else {
      loadingValue.value = false;
    }
    // loadingValue.value = true;
    //  update();
    print("LoadingBool: ${loadingbool}");
    print("LoadingValue: ${loadingValue.value}");
  }
}

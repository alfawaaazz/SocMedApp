import 'package:SocMedApp/models/position.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PositionController extends GetxController {
  final pos = PositionModel().obs;
  Position position;

  String apiKey = '53862ec8ca1bbd0799c36df21326f30f';

  // get latitude => position.latitude;
  // get longitude => position.longitude;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("Waiting for location");
    // position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    // print("position.latitude: ${position.latitude}");
    // print("position.longiotude: ${position.longitude}");

    // pos.update((val) {
    //   val.lat = position.latitude;
    //   val.lon = position.longitude;
    // });

    // print("Latitude: ${pos.value.lat}");
    // print("Longitude: ${pos.value.lon}");

    // print("Location Received");
    getPosition();
  }

  void getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("position.latitude: ${position.latitude}");
    print("position.longiotude: ${position.longitude}");

    pos.update((val) {
      val.lat = position.latitude;
      val.lon = position.longitude;
    });

    print("Latitude: ${pos.value.lat}");
    print("Longitude: ${pos.value.lon}");
  }
}

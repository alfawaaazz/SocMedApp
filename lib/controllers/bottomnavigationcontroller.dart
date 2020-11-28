import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // int currentIndex = 0;

  // void onTabTapped(int index) {
  //   currentIndex = index;

  //   update();
  // }

  final _selectedIndex = 0.obs;

  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}

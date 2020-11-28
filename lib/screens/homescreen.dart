import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/bottomnavigationcontroller.dart';
import 'package:SocMedApp/controllers/startupcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/screens/loadingscreen.dart';
import 'package:SocMedApp/screens/navigation/newsfeedscreen.dart';
import 'package:SocMedApp/screens/navigation/profilescreen.dart';
import 'package:SocMedApp/screens/navigation/weatherscreen.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthController> {
  final UserController userCont = Get.put<UserController>(UserController());
  final BottomNavigationController navCont =
      Get.put<BottomNavigationController>(BottomNavigationController());
  final List<Widget> pages = [
    WeatherScreen(),
    NewsFeedScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<StartUpController>().loadingbool
        ? LoadingScreen()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue,
              bottomNavigationBar: Obx(() => BottomNavigationBar(
                    onTap: (int index) => navCont.selectedIndex = index,
                    currentIndex: navCont.selectedIndex,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.cloud),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle),
                        label: "",
                      ),
                    ],
                  )),
              body: Obx(() => pages[navCont.selectedIndex]),
            ),
          ));
  }
}

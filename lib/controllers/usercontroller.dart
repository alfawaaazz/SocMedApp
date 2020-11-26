import 'package:SocMedApp/models/user.dart';
import 'package:get/get.dart';

class UserCOntroller extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}

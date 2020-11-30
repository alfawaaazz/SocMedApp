import 'package:SocMedApp/controllers/startupcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/models/user.dart';
import 'package:SocMedApp/screens/authscreen.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:SocMedApp/utils/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  @override
  void onInit() {
    // TODO: implement onInit
    _firebaseUser.bindStream(_auth.authStateChanges());
    Get.find<StartUpController>().toggleLoadingValue();
    super.onInit();
  }

  void createUser(
      String firstName, String lastName, String email, String password) async {
    Get.find<StartUpController>().loadingValue.value = true;
    update();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      UserModel _user = UserModel(
        id: _authResult.user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );

      if (await Database().createnewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }

      print("authController | createUser: User created successfully.");
      Get.find<StartUpController>().toggleLoadingValue();
    } catch (e) {
      Get.snackbar(
        "Error creating an account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    print("Loggin in");
    Get.find<StartUpController>().loadingValue.value = true;
    update();

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
      print("authcontroller.dart | login : User logged in");
      //toggleLoading();
      Get.find<StartUpController>().toggleLoadingValue();
    } catch (e) {
      Get.snackbar(
        "Email or Password is incorrect",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void loginWithGoogle() {
    try {} catch (e) {}
  }

  Future<String> signInWithGoogle() async {
    print("Signing in with google");
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      print("signin with google succeeded: $user");
      return "$user";
    }
    return "null";
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAll(Root());
      print("authcontroller.dart | signOut : User signed out.");
    } catch (e) {}
  }
}

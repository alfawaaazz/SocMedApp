import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends GetWidget<AuthController> {
  final Function toggleScreen;

  SignIn(this.toggleScreen);

  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              /*Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        width: double.infinity,
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),*/
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  controller: signInEmail,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: defaultDecoration("Email"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  controller: signInPass,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: defaultDecoration("Password"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 50,
                // color: Colors.black,
                child: GestureDetector(
                  onTap: () {
                    print("Sign In button pressed");
                    //controller.toggleLoading();
                    controller.login(signInEmail.text, signInPass.text);
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: toggleScreen,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Don't have an account? Sign Up here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

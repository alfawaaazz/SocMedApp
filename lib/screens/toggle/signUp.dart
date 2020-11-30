import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<AuthController> {
  final Function toggleScreen;
  final TextEditingController signUpEmail;
  final TextEditingController signUpPass;
  final TextEditingController firstName;
  final TextEditingController lastName;

  SignUp(
    this.toggleScreen,
    this.signUpEmail,
    this.signUpPass,
    this.firstName,
    this.lastName,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      color: Colors.blue,
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
                controller: firstName,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: defaultDecoration("First Name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: lastName,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: defaultDecoration("Last Name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: signUpEmail,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: defaultDecoration("Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: signUpPass,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: defaultDecoration("Password"),
                obscureText: true,
              ),
            ),
            /* Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),*/
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              // color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  print("Sign Up button pressed");
                  controller.createUser(
                    firstName.text,
                    lastName.text,
                    signUpEmail.text,
                    signUpPass.text,
                  );
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
                      "Sign Up",
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
                  "Already have an account? Sign In here.",
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
    );
  }
}

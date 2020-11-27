import 'package:SocMedApp/screens/toggle/signIn.dart';
import 'package:SocMedApp/screens/toggle/signUp.dart';
import 'package:SocMedApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    void toggleScreen() {
      setState(() {
        if (toggle == false) {
          toggle = true;
          print("Toggle Value: $toggle");
        } else {
          toggle = false;
          print("Toggle Value: $toggle");
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  height: 230,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "ConnectR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 70,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: toggle ? SignUp(toggleScreen) : SignIn(toggleScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

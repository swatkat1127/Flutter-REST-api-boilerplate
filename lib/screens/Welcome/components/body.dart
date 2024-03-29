import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carselona/Screens/Login/login_screen.dart';
import 'package:flutter_carselona/Screens/Welcome/components/background.dart';
import 'package:flutter_carselona/components/rounded_button.dart';
import 'package:flutter_carselona/constants.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/icons/carselona.png",
              height: 300,
              width: 320,
            ),

            SizedBox(height: size.height * 0.05
            ),

            RoundedButton(
              text: "Continue with email",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

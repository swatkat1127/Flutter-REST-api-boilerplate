import 'package:flutter/material.dart';
import 'package:flutter_carselona/Screens/Login/login_screen.dart';
import 'package:flutter_carselona/Screens/Signup/components/background.dart';
import 'package:flutter_carselona/components/already_have_an_account_acheck.dart';
import 'package:flutter_carselona/components/rounded_button.dart';
import 'package:flutter_carselona/components/rounded_input_field.dart';
import 'package:flutter_carselona/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_carselona/Screens/homepage.dart';

class Body extends StatelessWidget {
  String email;
  String password;
  String password2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/icons/carselona.png",
              height: 300,
              width: 320,
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: TextEditingController(),
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              hintText: "enter password",
              controller: TextEditingController(),
              onChanged: (value) {
                password = value.trim();
              },
            ),
            RoundedPasswordField(
              hintText: "confirm password",
              controller: TextEditingController(),
              onChanged: (value) {
                password2 = value.trim();
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                String signUpURL = env['baseUrl'] + '/signup';
                // print(signUpURL);
                var response = await http.post(
                  signUpURL,
                  headers: {"Accept": "application/json"},
                  body: {
                    "email": email,
                    "password": password,
                    "password2": password2
                  },
                );
                var data = json.decode(response.body);
                // print("sent from server::");
                // print(data);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => HomePage()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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

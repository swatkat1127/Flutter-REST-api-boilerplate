import 'package:flutter/material.dart';
import 'package:flutter_carselona/Screens/Welcome/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_carselona/Screens/homepage.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var email = sharedPreferences.getString("email");
      if (email != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {return HomePage();})
        );
      } else {
        return;
      }
    });
  }
}


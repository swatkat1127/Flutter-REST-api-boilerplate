import 'package:flutter/material.dart';
import 'package:flutter_carselona/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_carselona/screens/Welcome/welcome_screen.dart';

Future<void> main() async {
  await DotEnv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CarselonaDaily',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xFF182539),
      ),
      home: WelcomeScreen(),
    );
  }
}

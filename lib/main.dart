import 'package:ciapp/pages/get_started.dart';
import 'package:ciapp/pages/login.dart';
import 'package:ciapp/pages/settings_page.dart';
import 'package:ciapp/providers/home_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() async{
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  return runApp(CiApp());
}
class CiApp extends StatelessWidget {
  const CiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        Settings.routeName: (_) => Settings(),
        GetStarted.routeName: (_) => GetStarted(),
        Login.routeName: (_) => Login(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "Money Wallet",
      debugShowCheckedModeBanner: false,


    );
  }
}


import 'package:ciapp/providers/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login.dart';

class GetStarted extends StatefulWidget {
  static const routeName = "/";
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  getStarted() async{
    const prefs = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true, resetOnError: false));
    if( !await prefs.containsKey(key: "notNew")){
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
  setNotNew() async{
    const prefs = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true, resetOnError: false));
    prefs.write(key: "notNew", value: "true");
    debugPrint("show this message");
    Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
  }
  @override
  void initState() {
    // TODO: implement initState
    getStarted();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100, left: 15, right: 28.0, bottom: 30),
              child: Text("The Secret Of Getting Ahead Is Getting Started.",
              style: TextStyle(color: Colors.white70, fontSize: 30)),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Card(
                color: Colors.grey.withOpacity(0.6),
                margin: const EdgeInsets.only(
                  left: 25,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Login.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                    child: Text("Get Started", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

import 'package:ciapp/providers/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);
confirmDialog() async{
  showCupertinoDialog(
      context: context,
      barrierLabel: "Confirm your number",
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (_){
        return CupertinoAlertDialog(
          content: Text("You will receive a code on +237 ${phoneController.text.toString()}"),
          title: Text("Verify phone number"),
          insetAnimationDuration: Duration(milliseconds: 700),
          insetAnimationCurve: Curves.easeInToLinear,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: const Text("Verify"),
            ),
          ],
        );
      }
  );
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
        child: CupertinoPageScaffold(child: Container(
          color: const Color.fromRGBO(250, 250, 250, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text("Log in", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w800)),
                  Text("Fill the Form to log in"),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Card(
                          elevation: 15,
                          color: Colors.white,
                          shadowColor: Colors.grey.withOpacity(.24),
                          child: SizedBox(
                            width: size.width - 40,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (val){
                                    if(val!.isEmpty){
                                      return "Enter valid Email";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor,
                                          width: 2,
                                          style: BorderStyle.solid
                                      ),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    label: const Text("Email"),
                                    hintText: "Email",
                                    prefixIcon: const Icon(Icons.person),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  validator: (val){
                                    if(val!.isEmpty){
                                      return "Enter valid Phone Number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor,
                                          width: 2,
                                          style: BorderStyle.solid
                                      ),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    label: const Text("Phone"),
                                    hintText: "Enter phone number",
                                    prefixIcon: const Icon(Icons.phone),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (val){
                                    if(val!.isEmpty){
                                      return "Enter a password";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor,
                                          width: 2,
                                          style: BorderStyle.solid
                                      ),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    label: const Text("Password"),
                                    hintText: "Enter password",
                                    prefixIcon: const Icon(Icons.security),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  textInputAction: TextInputAction.send,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: const Text("Login instead"),
                            ),

                            InkWell(
                              onTap: (){},
                              child: const Text("Reset Password", style: TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextButton.icon(
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      debugPrint("done validating");
                      confirmDialog();
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Sign Up"),
                ),
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }
}

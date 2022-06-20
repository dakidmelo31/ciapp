import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  static const routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color backgroundColor = Colors.white;
  bool paymentNotifications = false;
  bool blackTheme = false;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);
    String amount = "";
    TextEditingController amountController = TextEditingController();
    TextStyle thinStyle =
    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);
    TextStyle cardTitle =
    TextStyle(fontWeight: FontWeight.w300, color: Colors.white60);
    TextStyle boldStyle = TextStyle(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 30);
    Size size = MediaQuery.of(context).size;
    List<String> transactions = [
      "Nfor Nathaniel",
      "Victor Ndip",
      "Abang Abel",
      "Synthia Mbangi",
      "Ivana Nyasem",
      "Anyi Bessem",
      "David Mankam"
    ];

    showNotifications() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          builder: (context) {
            return Container(
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20,
                    sigmaY: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Colors.black26,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: .8,
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black12,
                                  width: .5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: ListView.builder(
                              physics:
                              const BouncingScrollPhysics(),
                              itemCount: 36,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: [
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: ListTile(
                                        onTap: () {},
                                        enabled: true,
                                        contentPadding:
                                        const EdgeInsets
                                            .symmetric(
                                            vertical: 3),
                                        dense: true,
                                        horizontalTitleGap: 10,
                                        leading: ClipOval(
                                          child: Container(
                                              width: 40,
                                              height: 40,
                                              color: Random().nextInt(
                                                  100) %
                                                  2 ==
                                                  1
                                                  ? Colors
                                                  .orange
                                                  : Colors
                                                  .lightGreen,
                                              alignment:
                                              Alignment
                                                  .center,
                                              child: Icon(
                                                  Random().nextInt(
                                                      100) %
                                                      2 ==
                                                      1
                                                      ? Icons
                                                      .message
                                                      : Icons
                                                      .lock,
                                                  color: Colors
                                                      .white)),
                                        ),
                                        title: Text(
                                            "Eneo bills piling up"),
                                        subtitle: Text(
                                            "you have not paid your eneo bills for 3 months now"),
                                        trailing: Row(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            ClipOval(
                                              child: Container(
                                                color:
                                                primaryColor,
                                                width: 26,
                                                height: 26,
                                                child: Center(
                                                  child: Text(
                                                    "${Random().nextInt(20)}",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Icon(Icons
                                                .chevron_right),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: primaryColor
                                          .withOpacity(.2),
                                      indent: 10,
                                      endIndent: 10,
                                      height: 1,
                                      thickness: 1,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              backgroundColor: primaryColor,
              actions: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    IconButton(
                      onPressed: () {
                        showNotifications();
                      },
                      icon: const Icon(Icons.notifications),
                    ),
                    Positioned(
                        bottom: 15,
                        right: 30,
                        child: ClipOval(
                          child: Container(
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 4),
                                child: Text("3",
                                    style: TextStyle(color: Colors.white)),
                              ),
                          ),
                        ),
                    ),
                  ],
                ),
              ],
              title: Text("Profile"),
              floating: true,
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: size.height * .3,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                title: Text("Philip Ndula"),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset("assets/m6.jpg", width: double.infinity, height: double.infinity, fit: BoxFit.cover,alignment: Alignment.center,),
                    Container(
                      color: primaryColor.withOpacity(.6)
                    )
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Payment Settings"),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  color: Colors.white,
                  elevation: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Payment Notifications"),
                                    Text("Always receive notifications", style: thinStyle)
                                  ],
                                ),
                                CupertinoSwitch(value: paymentNotifications, onChanged: (val){
                                  setState(() {
                                    paymentNotifications = val;
                                  });
                                },),
                              ],
                            )
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Payment Settings"),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  color: Colors.white,
                  elevation: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Switch Mode"),
                                  ],
                                ),
                                CupertinoSwitch(value: blackTheme, onChanged: (val){
                                  setState((){
                                    blackTheme = val;
                                    backgroundColor = blackTheme? Colors.deepPurple : Colors.white;
                                  });
                                },),
                              ],
                            )
                        ),
                      )

                    ],
                  ),
                ),


                // General settings
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Personal Settings"),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  color: Colors.white,
                  elevation: 8,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){},
                        enabled: false,
                        leading: Icon(Icons.person),
                        title: Text("Change Your name"),
                        subtitle: Text("Cannot change your name once verified"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      ListTile(
                        onTap: (){},
                        enabled: true,
                        leading: Icon(Icons.phone),
                        title: Text("Change Phone Number"),
                        subtitle: Text("Edit your Phone number"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      ListTile(
                        onTap: (){},
                        enabled: true,
                        leading: Icon(Icons.security),
                        title: Text("Change Your Pin"),
                        subtitle: Text("Edit or remove your pin"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      ListTile(
                        onTap: (){},
                        enabled: true,
                        leading: Icon(Icons.edit),
                        title: Text("Change Address"),
                        subtitle: Text("Edit your address"),
                        trailing: Icon(Icons.chevron_right),
                      ),

                      ListTile(
                        onTap: (){},
                        enabled: true,
                        leading: Icon(Icons.power, color: primaryColor),
                        title: Text("Logout"),
                        trailing: Icon(Icons.logout, color: primaryColor),
                      ),

                    ],
                  ),
                )

              ]
            ))
          ],
        ),
      )
    );
  }
}

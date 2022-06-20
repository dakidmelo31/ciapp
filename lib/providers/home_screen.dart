import 'dart:math';
import 'dart:ui';

import 'package:ciapp/pages/get_started.dart';
import 'package:ciapp/pages/savings_page.dart';
import 'package:ciapp/pages/settings_page.dart';
import 'package:ciapp/pages/topup_account.dart';
import 'package:ciapp/pages/transactions_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navigationIndex = 0;
  Widget mainWidget = const Center(child: Text("show this text"));
  @override
  Widget build(BuildContext context) {
    String amount = "";
    TextEditingController amountController = TextEditingController();
    TextStyle thinStyle =
        const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);
    TextStyle cardTitle =
        const TextStyle(fontWeight: FontWeight.w300, color: Colors.white60);
    TextStyle boldStyle = const TextStyle(
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
    Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);

    updateScreen(int index){

      switch(index){
        case 0:
          mainWidget = CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                actions: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              barrierColor: Colors.black.withOpacity(.5),
                              builder: (context) {
                                return Container(
                                  margin: const EdgeInsets.all(0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: const BorderRadius.all(
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
                                                        title: const Text(
                                                            "Eneo bills piling up"),
                                                        subtitle: const Text(
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
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.notifications),
                      ),
                      Positioned(
                          bottom: 30,
                          child: ClipOval(
                            child: Container(
                                color: Colors.red,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 6),
                                  child: Text("3",
                                      style: TextStyle(color: Colors.white)),
                                )),
                          )),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to settings page

                      Navigator.pushNamed(context, Settings.routeName);
                    },
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8),
                          child: Align(
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/m6.jpg",
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                title: const Text("CiApp"),
                centerTitle: true,
                elevation: 0,
                floating: true,
                pinned: true,
                flexibleSpace: const FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground
                  ],
                ),
                backgroundColor: const Color.fromRGBO(76, 48, 255, 1.0),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Color.fromRGBO(230, 230, 245, 1),
                        width: double.infinity,
                        height: 290,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                color: const Color.fromRGBO(76, 48, 255, 1.0),
                                height: 245,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: const Color.fromRGBO(230, 230, 245, 1),
                                height: 145,
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              shadowColor: Colors.black.withOpacity(0.5),
                              elevation: 15,
                              child: SizedBox(
                                width: size.width - 20,
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 25.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total Balance",
                                                  style: thinStyle,
                                                ),
                                                Text("\$ 2,562.50",
                                                    style: boldStyle),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(right: 18.0),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(8)),
                                              child: Card(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 15),
                                                color: Colors.grey.withOpacity(.2),
                                                elevation: 0,
                                                child: InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor:
                                                        Colors.white,
                                                        enableDrag: true,
                                                        isDismissible: true,
                                                        builder: (_) {
                                                          return Container(
                                                            margin: const EdgeInsets
                                                                .all(0),
                                                            child: SizedBox(
                                                              child: Column(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    Container(
                                                                      child:
                                                                      ListView(
                                                                        shrinkWrap:
                                                                        true,
                                                                        physics: const BouncingScrollPhysics(
                                                                            parent:
                                                                            AlwaysScrollableScrollPhysics()),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                            10,
                                                                            vertical:
                                                                            5),
                                                                        children: [
                                                                          const Text(
                                                                            "Add balance",
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                20,
                                                                                fontWeight:
                                                                                FontWeight.w700),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                            120,
                                                                            width: double
                                                                                .infinity,
                                                                            child: ListView
                                                                                .builder(
                                                                              scrollDirection:
                                                                              Axis.horizontal,
                                                                              shrinkWrap:
                                                                              true,
                                                                              physics:
                                                                              BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
                                                                              itemCount:
                                                                              6,
                                                                              itemBuilder: (_, index) =>
                                                                                  Card(
                                                                                    elevation:
                                                                                    10,
                                                                                    margin:
                                                                                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                                    child:
                                                                                    InkWell(
                                                                                      onTap: () {},
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                          Lottie.asset("assets/animations/loading3.json", width: 60, height: 60, fit: BoxFit.fill),
                                                                                          const Text("Payment Method",
                                                                                              style: TextStyle(
                                                                                                fontWeight: FontWeight.w600,
                                                                                              )),
                                                                                        ]),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          const Padding(
                                                                            padding:
                                                                            EdgeInsets.only(
                                                                              top:
                                                                              15,
                                                                            ),
                                                                            child: Text("Enter Amount"),
                                                                          ),
                                                                          TextField(
                                                                            controller: amountController,
                                                                            enabled:
                                                                            true,
                                                                            keyboardType:
                                                                            TextInputType.number,
                                                                            style: TextStyle(
                                                                                color:
                                                                                primaryColor),
                                                                            textInputAction: TextInputAction.send,
                                                                            onEditingComplete: (){
                                                                              amount = amountController.text;
                                                                              debugPrint("send amount: $amount");
                                                                            },
                                                                            onChanged: (val){
                                                                              amount = amountController.text;
                                                                              debugPrint("send amount: $amount");
                                                                            },
                                                                            onSubmitted: (_){
                                                                              amount = amountController.text;
                                                                              debugPrint("send amount: $amount");
                                                                              SnackBar successSnack = SnackBar(content: const Text("Requesting payments"),
                                                                                backgroundColor: primaryColor,
                                                                                duration: const Duration(seconds: 2),
                                                                              );
                                                                              ScaffoldMessenger.of(context).showSnackBar(successSnack);
                                                                              Navigator.of(context).pop();
                                                                              showCupertinoDialog(context: context,
                                                                                  barrierDismissible: true,
                                                                                  builder: (_){
                                                                                    return CupertinoAlertDialog(
                                                                                      title: Text("Requesting Payments from ABC"),
                                                                                      content: Text("Dial ABC to confirm payment"),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: (){
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text("Cancel"),
                                                                                        ),

                                                                                        TextButton(
                                                                                          onPressed: (){
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text("Verify"),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }
                                                                              );

                                                                            },
                                                                            decoration: InputDecoration(
                                                                              hintText: "Amount",
                                                                              enabled: true,
                                                                              fillColor: Colors.white,
                                                                              filled: true,
                                                                              suffixIcon: Icon(Icons.money),
                                                                              labelText: "Add amount",
                                                                              border: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: primaryColor,
                                                                                  width: 5,
                                                                                ),),),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: size.width,
                                                                    height: 80,
                                                                    child: CupertinoButton.filled(
                                                                      borderRadius:BorderRadius.zero,
                                                                      child: Text("Deposit"),
                                                                      onPressed: (){
                                                                        showModalBottomSheet(
                                                                            context: context,
                                                                            backgroundColor:
                                                                            Colors.white,
                                                                            enableDrag: true,
                                                                            isDismissible: true,
                                                                            builder: (_) {
                                                                              return Container(
                                                                                margin: const EdgeInsets
                                                                                    .all(0),
                                                                                child: SizedBox(
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child:
                                                                                        Container(
                                                                                          child:
                                                                                          ListView(
                                                                                            shrinkWrap:
                                                                                            true,
                                                                                            physics: BouncingScrollPhysics(
                                                                                                parent:
                                                                                                AlwaysScrollableScrollPhysics()),
                                                                                            padding: EdgeInsets.symmetric(
                                                                                                horizontal:
                                                                                                10,
                                                                                                vertical:
                                                                                                5),
                                                                                            children: [
                                                                                              const Text(
                                                                                                "Add balance",
                                                                                                style: TextStyle(
                                                                                                    fontSize:
                                                                                                    20,
                                                                                                    fontWeight:
                                                                                                    FontWeight.w700),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height:
                                                                                                120,
                                                                                                width: double
                                                                                                    .infinity,
                                                                                                child: ListView
                                                                                                    .builder(
                                                                                                  scrollDirection:
                                                                                                  Axis.horizontal,
                                                                                                  shrinkWrap:
                                                                                                  true,
                                                                                                  physics:
                                                                                                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                                                  itemCount:
                                                                                                  6,
                                                                                                  itemBuilder: (_, index) =>
                                                                                                      Card(
                                                                                                        elevation:
                                                                                                        10,
                                                                                                        margin:
                                                                                                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                                                        child:
                                                                                                        InkWell(
                                                                                                          onTap: () {},
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                                            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                                              Lottie.asset("assets/animations/loading3.json", width: 60, height: 60, fit: BoxFit.fill),
                                                                                                              const Text("Payment Method",
                                                                                                                  style: TextStyle(
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  )),
                                                                                                            ]),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              const Padding(
                                                                                                padding:
                                                                                                EdgeInsets.only(
                                                                                                  top:
                                                                                                  15,
                                                                                                ),
                                                                                                child: Text("Enter Amount"),
                                                                                              ),
                                                                                              TextField(
                                                                                                controller: amountController,
                                                                                                enabled:
                                                                                                true,
                                                                                                keyboardType:
                                                                                                TextInputType.number,
                                                                                                style: TextStyle(
                                                                                                    color:
                                                                                                    primaryColor),
                                                                                                textInputAction: TextInputAction.send,
                                                                                                onEditingComplete: (){
                                                                                                  amount = amountController.text;
                                                                                                  debugPrint("send amount: $amount");
                                                                                                },
                                                                                                onChanged: (val){
                                                                                                  amount = amountController.text;
                                                                                                  debugPrint("send amount: $amount");
                                                                                                },
                                                                                                onSubmitted: (_){
                                                                                                  amount = amountController.text;
                                                                                                  debugPrint("send amount: $amount");
                                                                                                  SnackBar successSnack = SnackBar(content: Text("Requesting payments"),
                                                                                                    backgroundColor: primaryColor,
                                                                                                    duration: Duration(seconds: 2),
                                                                                                  );
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(successSnack);
                                                                                                  Navigator.of(context).pop();
                                                                                                  showCupertinoDialog(context: context,
                                                                                                      barrierDismissible: true,
                                                                                                      builder: (_){
                                                                                                        return CupertinoAlertDialog(
                                                                                                          title: Text("Requesting Payments from ABC"),
                                                                                                          content: Text("Dial ABC to confirm payment"),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: (){},
                                                                                                              child: Text("Cancel"),
                                                                                                            ),

                                                                                                            TextButton(
                                                                                                              onPressed: (){},
                                                                                                              child: Text("Verify"),
                                                                                                            ),

                                                                                                          ],
                                                                                                        );
                                                                                                      }
                                                                                                  );
                                                                                                },
                                                                                                decoration: InputDecoration(
                                                                                                  hintText: "Amount",
                                                                                                  enabled: true,
                                                                                                  fillColor: Colors.white,
                                                                                                  filled: true,
                                                                                                  suffixIcon: Icon(Icons.money),
                                                                                                  labelText: "Add amount",
                                                                                                  border: UnderlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: primaryColor,
                                                                                                      width: 5,
                                                                                                    ),),),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: size.width,
                                                                                        height: 80,
                                                                                        child: CupertinoButton.filled(
                                                                                          borderRadius:BorderRadius.zero,
                                                                                          child: Text("Deposit"),
                                                                                          onPressed: (){
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
                                                                                          },
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                                    child: Center(
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.withOpacity(.3),
                                      height: 4,
                                      thickness: 2,
                                      endIndent: 50,
                                      indent: 50,
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Card(
                                                  color: Colors.pinkAccent,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(12.0),
                                                    child: Icon(
                                                        Icons
                                                            .arrow_downward_rounded,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text("Withdraw")
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Card(
                                                  color: Color.fromRGBO(
                                                      76, 48, 255, 1.0),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(12.0),
                                                    child: Icon(
                                                        Icons.arrow_forward_sharp,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text("Send")
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Card(
                                                  color: Colors.green,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(12.0),
                                                    child: Icon(Icons.money,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text("Cards")
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Card(
                                                  color: Colors.orange,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(12.0),
                                                    child: Icon(Icons.refresh,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text("Recharge")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Material(
                        elevation: 0,
                        color: const Color.fromRGBO(230, 230, 245, 1),
                        child: GridView.count(
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 4 / 2,
                          semanticChildCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          children: [
                            //Analytics Cards
                            Card(
                              elevation: 8,
                              shadowColor: Colors.green.withOpacity(.4),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Income",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "\$ 500",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.deepOrange.withOpacity(.4),
                              elevation: 8,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Expenses",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "\$ 500",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              elevation: 8,
                              shadowColor: Colors.grey.withOpacity(.4),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Total Bills",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "\$ 500",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              elevation: 8,
                              shadowColor: primaryColor.withOpacity(.4),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Savings",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "\$ 500",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // End Analytics Card
                          ],
                        ),
                      ),
                      Container(
                        color: Color.fromRGBO(230, 230, 245, 1),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * .12,
                              width: size.width,
                              child: ListView.builder(
                                itemCount: transactions.length,
                                padding: const EdgeInsets.only(left: 20),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (_, index) {
                                  var name = split(transactions[index]);
                                  return Card(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0, vertical: 3),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                const BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                                child: Image.asset("assets/m6.jpg",
                                                    width: size.height * .06,
                                                    height: size.height * .06,
                                                    fit: BoxFit.cover)),
                                            Text(name[0])
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transactions", style: boldStyle),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("See All"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: transactions
                                  .map((e) => Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 18),
                                color: Colors.white,
                                elevation: 0,
                                shadowColor: Colors.black.withOpacity(0.2),
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  (6),
                                                ),
                                                child: Image.asset(
                                                    "assets/m4.jpg",
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.cover),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      e,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                        height: 5,
                                                    ),
                                                    Text(e.length > 10
                                                        ? "Transfer"
                                                        : "Shopping", style: TextStyle(color: Colors.black.withOpacity(.4)))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              e.length > 10
                                                  ? const Text(
                                                "\$215",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 18),
                                              )
                                                  : const Text(
                                                "-\$76",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ],
          );
          break;
        case 1:
          mainWidget = const Savings();
          break;
        case 2:
          mainWidget = const Topup();
          break;
        case 3:
          mainWidget = const Transactions();
          break;

        case 4:
          mainWidget = Settings();
          break;
      }

    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(76, 48, 255, 1.0),
      body: mainWidget,
      drawer: Drawer(
        elevation: 20,
        child: Container(
          color: Color.fromRGBO(230, 230, 245, 1),
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: size.height * .09,
                color: Color.fromRGBO(230, 230, 245, 1),
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/m4.jpg",
                                width: 60, height: 60, fit: BoxFit.cover)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8.0),
                          child: Column(
                            children: [
                              Text(
                                "Username here",
                                style: boldStyle,
                              ),
                              Text(
                                "6494934034",
                                style: thinStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                height: size.height * .2,
                width: double.infinity,
                color: primaryColor,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Balance",
                              style: TextStyle(color: Colors.white60)),
                          Text(
                            "\$ 2,500.5",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * .006),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                  Colors.white,
                                  enableDrag: true,
                                  isDismissible: true,
                                  builder: (_) {
                                    return Container(
                                      margin: const EdgeInsets
                                          .all(0),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child:
                                              Container(
                                                child:
                                                ListView(
                                                  shrinkWrap:
                                                  true,
                                                  physics: BouncingScrollPhysics(
                                                      parent:
                                                      AlwaysScrollableScrollPhysics()),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                      10,
                                                      vertical:
                                                      5),
                                                  children: [
                                                    Text(
                                                      "Add balance",
                                                      style: TextStyle(
                                                          fontSize:
                                                          20,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                      120,
                                                      width: double
                                                          .infinity,
                                                      child: ListView
                                                          .builder(
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        shrinkWrap:
                                                        true,
                                                        physics:
                                                        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                        itemCount:
                                                        6,
                                                        itemBuilder: (_, index) =>
                                                            Card(
                                                              elevation:
                                                              10,
                                                              margin:
                                                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                              child:
                                                              InkWell(
                                                                onTap: () {},
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                    Lottie.asset("assets/animations/loading3.json", width: 60, height: 60, fit: BoxFit.fill),
                                                                    Text("Payment Method",
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w600,
                                                                        )),
                                                                  ]),
                                                                ),
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                        top:
                                                        15,
                                                      ),
                                                      child: Text("Enter Amount"),
                                                    ),
                                                    TextField(
                                                      controller: amountController,
                                                      enabled:
                                                      true,
                                                      keyboardType:
                                                      TextInputType.number,
                                                      style: TextStyle(
                                                          color:
                                                          primaryColor),
                                                      textInputAction: TextInputAction.send,
                                                      onEditingComplete: (){
                                                        amount = amountController.text;
                                                        debugPrint("send amount: $amount");
                                                      },
                                                      onChanged: (val){
                                                        amount = amountController.text;
                                                        debugPrint("send amount: $amount");
                                                      },
                                                      onSubmitted: (_){
                                                        amount = amountController.text;
                                                        debugPrint("send amount: $amount");
                                                        SnackBar successSnack = SnackBar(content: Text("Requesting payments"),
                                                          backgroundColor: primaryColor,
                                                          duration: Duration(seconds: 2),
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(successSnack);
                                                        Navigator.of(context).pop();
                                                        showCupertinoDialog(context: context,
                                                            barrierDismissible: true,
                                                            builder: (_){
                                                              return CupertinoAlertDialog(
                                                                title: Text("Requesting Payments from ABC"),
                                                                content: Text("Dial ABC to confirm payment"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: (){},
                                                                    child: Text("Cancel"),
                                                                  ),

                                                                  TextButton(
                                                                    onPressed: (){},
                                                                    child: Text("Verify"),
                                                                  ),

                                                                ],
                                                              );
                                                            }
                                                        );

                                                      },
                                                      decoration: InputDecoration(
                                                        hintText: "Amount",
                                                        enabled: true,
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        suffixIcon: Icon(Icons.money),
                                                        labelText: "Add amount",
                                                        border: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: primaryColor,
                                                            width: 5,
                                                          ),),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width,
                                              height: 80,
                                              child: CupertinoButton.filled(
                                                borderRadius:BorderRadius.zero,
                                                child: Text("Deposit*"),
                                                onPressed: (){
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
                                                                  color: Color.fromRGBO(230, 230, 245, 1),
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
                                                },
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: Colors.black.withOpacity(.1),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child:
                                          Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text("Deposit", style: cardTitle)
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: Colors.black.withOpacity(.1),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.arrow_downward_sharp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text("Withdraw", style: cardTitle)
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: Colors.black.withOpacity(.1),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.arrow_forward_sharp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text("Send", style: cardTitle)
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: Colors.black.withOpacity(.1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Icon(Icons.credit_card,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text("Cards", style: cardTitle)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Quick Send",
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ),
              SizedBox(
                height: size.height * .1,
                width: size.width,
                child: ListView.builder(
                  itemCount: transactions.length,
                  padding: EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(
                      parent: const AlwaysScrollableScrollPhysics()),
                  itemBuilder: (_, index) {
                    var name = split(transactions[index]);
                    return Padding(
                      padding: EdgeInsets.all(size.width * .01),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                              child: Image.asset("assets/m6.jpg",
                                  width: size.height * .06,
                                  height: size.height * .06,
                                  fit: BoxFit.cover)),
                          Text(name[0])
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child:
                          Icon(Icons.assessment, color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {},
                title: Text("Overview"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.history, color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {},
                title: Text("Transaction History"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.credit_card,
                          color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {},
                title: Text("My Deposit Methods"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Other",
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child:
                          Icon(Icons.settings, color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      Settings.routeName);
                },
                title: Text("Settings"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.message_outlined,
                          color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {},
                title: Text("Support"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
              ListTile(
                leading: ClipOval(
                  child: Container(
                    color: primaryColor.withOpacity(1),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.logout, color: Colors.white, size: 15),
                    ),
                  ),
                ),
                onTap: () {},
                title: Text("Logout"),
                trailing: Icon(Icons.chevron_right, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
        items: [
          Icon(Icons.home),
          Icon(Icons.credit_card),
          Icon(Icons.add),
          Icon(Icons.history),
          Icon(Icons.settings)
        ],
        index: navigationIndex,
        onTap: (index){
          debugPrint("$index");
          navigationIndex = index;
          setState(() {
            updateScreen(navigationIndex);
          });
        },
        height: 50,
        animationCurve: Curves.easeInToLinear,
        animationDuration: Duration(milliseconds: 400),
      ),
    );
  }
}

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextStyle thinStyle =
    const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);
    TextStyle cardTitle =
    const TextStyle(fontWeight: FontWeight.w300, color: Colors.white60);
    TextStyle boldStyle = const TextStyle(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20);

    Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);
    Size size = MediaQuery.of(context).size;
    String amount = "";
    List<String> filters = ["Successful", "Failed", "Pending", "Cancelled"];

    List<String> transactions = [
      "Nfor Nathaniel",
      "Victor Ndip",
      "Abang Abel",
      "Boris Nfor",
      "Babila Samuel",
      "Juliana Sandrine",
      "Beltus Dadu",
      "Shefter Gildas",
      "Anoda Mann",
      "Synthia Mbangi",
      "Ivana Nyasem",
      "Anyi Bessem",
      "David Mankam"
    ];

    return Scaffold(
      body: CupertinoPageScaffold(
        child: SafeArea(

          child: SizedBox(
            width: size.width,
            height: size.height,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 14,
                ),
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
                        Text("Transaction History", style: boldStyle),
                        IconButton(
                          onPressed: () async{
                            debugPrint("Show filter Options");
                            bool outcome = false;

                            outcome = await showModalBottomSheet(
                                context: context,
                                backgroundColor:
                                Colors.white,
                                enableDrag: true,
                                isDismissible: true,
                                builder: (_) {
                                  return SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child:
                                          Container(
                                            child:
                                            ListView.builder(
                                              shrinkWrap:
                                              true,
                                              physics: BouncingScrollPhysics(
                                                  parent:
                                                  AlwaysScrollableScrollPhysics()),
                                              itemCount: filters.length,
                                              reverse: true,
                                              itemBuilder: (_, index){
                                                if(index == filters.length -1){
                                                  return Align(
                                                    alignment: Alignment.topCenter,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Choose Filters"),
                                                      ));
                                                }
                                                return SwitchListTile.adaptive(value: Random().nextInt(2) %2 == 0? true : false, onChanged: (updateState){},
                                                  title: Text(filters[index]),
                                                  dense: true,
                                                  activeThumbImage: AssetImage("assets/bg2.jpg"),
                                                  selectedTileColor: Colors.blue,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Icons.filter_list_alt, color: primaryColor),
                          iconSize: 24,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
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
          ),
        ),
      ),
    );
  }
}

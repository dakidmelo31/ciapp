import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Savings extends StatelessWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController amountController = TextEditingController();
    TextStyle thinStyle =
        const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey);
    TextStyle cardTitle =
        const TextStyle(fontWeight: FontWeight.w300, color: Colors.white60);
    TextStyle boldStyle = const TextStyle(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 30);

    Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);
    Size size = MediaQuery.of(context).size;
    TextEditingController savingName = TextEditingController();
    TextEditingController amount = TextEditingController();
    String duration = "";
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          debugPrint("Show filter Options");
          bool outcome = false;

          outcome = await showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              enableDrag: true,
              isDismissible: true,
              builder: (_) {
                return SizedBox(
                  height: size.height - 10,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Divider(
                                  color: Colors.grey.withOpacity(.2),
                                  height: 2,
                                  thickness: 1,
                                  endIndent: 50,
                                  indent: 50,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Create Saving Channel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: primaryColor,
                                        fontSize: 18)),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: TextFormField(
                                      controller: savingName,
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "Enter valid Name";
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
                                        label: const Text("Reason for savings"),
                                        hintText: "House rent",
                                        prefixIcon: Icon(Icons.edit, color: primaryColor),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: TextFormField(
                                      controller: amountController,
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "Enter valid amount";
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
                                        label: const Text("Amount to save"),
                                        hintText: "2000",
                                        prefixIcon: Icon(Icons.credit_card, color: primaryColor),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),

                                ],
                              ),

                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add, color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 15,
      ),
      body: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Saving Goals", style: boldStyle),
                      TextButton(
                        onPressed: () {},
                        child: Text("See All"),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    "New Furniture",
                    "Builder's Salary",
                    "Eneo Bills",
                    "Internet Service",
                    "House Rent",
                    "Clothes Shopping",
                    "New Ceiling",
                    "House Renovation"
                  ]
                      .map((e) => Card(
                            margin:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            shadowColor: Colors.grey.withOpacity(.3),
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.lightGreen.withOpacity(.2),
                              highlightColor: Colors.white.withOpacity(.2),
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(e,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16)),
                                                Text("LifeStyle",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 14)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    "\$ ${Random().nextInt(10000)}"),
                                                Text(
                                                    "/${Random().nextInt(1000000)}")
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(6)),
                                        child: LinearProgressIndicator(
                                          value: Random().nextDouble(),
                                          semanticsLabel: "70%",
                                          semanticsValue: "70%",
                                          backgroundColor:
                                              Colors.grey.withOpacity(.3),
                                          color: primaryColor,
                                          minHeight: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 5,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

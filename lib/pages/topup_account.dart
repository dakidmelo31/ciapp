import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Topup extends StatefulWidget {
  const Topup({Key? key}) : super(key: key);

  @override
  _TopupState createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color.fromRGBO(76, 48, 255, 1.0);
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: GridView.count(
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 3 / 3,
            semanticChildCount: 20,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              //Analytics Cards
              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/ecommerce.json"),
                        Text(
                          "MTN Mobile Money",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading2.json"),
                        Text(
                          "Other Payment Method",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Bank Transfer",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Orange Money",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Orange Money",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/ecommerce.json"),
                        Text(
                          "PayPal",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Bank Transfer",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Yup Money",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "World Remit",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/ecommerce.json"),
                        Text(
                          "Etherium",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading2.json"),
                        Text(
                          "Other Payment Method",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Bank Transfer",
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
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Western Union",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),              Card(
                elevation: 14,
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
                        Lottie.asset("assets/animations/loading4.json"),
                        Text(
                          "Bitcoins",
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

              // End Analytics Card
            ],
          ),
        ),
      ),
    );
  }
}

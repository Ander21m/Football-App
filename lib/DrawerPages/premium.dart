import 'package:flutter/material.dart';
import 'package:footballcustom/MainPages/Utility/utility.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  bool isPro = false;
  String selectedText = "Subscribe Premium(THB 5,000)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility().getNormalAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      "User name",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Container(height: 4, color: Colors.grey),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPro = false;
                        selectedText = "Subscribe Premium(THB 5,000)";
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 185,
                          height: 180,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          color: !isPro ? Colors.yellow : Colors.grey,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Premium",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "THB 5,000 ",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "per month",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        !isPro
                            ? Positioned(
                                right: 2,
                                top: 2,
                                child: Icon(Icons.check_circle),
                              )
                            : Positioned(
                                right: 2,
                                top: 2,
                                child: Icon(Icons.circle_outlined))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPro = true;
                        selectedText ="Subscribe Pro Premium(THB 7,000)";
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 185,
                          height: 180,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          color: isPro ? Colors.yellow : Colors.grey,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Premium Pro",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "THB 7,000 ",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "per month",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        isPro
                            ? Positioned(
                                right: 2,
                                top: 2,
                                child: Icon(Icons.check_circle),
                              )
                            : Positioned(
                                right: 2,
                                top: 2,
                                child: Icon(Icons.circle_outlined))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                    "Once purchased, the premium will always renew automatically after it expired. The user can cancel the purchase renewal anytime soon")),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 370,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.orange),
              child: Center(
                  child: Text(
                selectedText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              color: const Color.fromARGB(255, 195, 189, 189),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "Premium Features",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 160,
                        height: 50,
                        color: Colors.grey,
                        child: Center(child: Text("Features")),
                      ),
                      Container(
                        height: 50,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 50,
                        color: Colors.grey,
                        child: Center(child: Text("Premium")),
                      ),
                      Container(
                        height: 50,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 50,
                        color: Colors.grey,
                        child: Center(child: Text("Premium Pro")),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 2,
                    width: 390,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 160,
                        height: 40,
                        child: Row(
                          children: [
                            Text("Free Tip Stars"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check)],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check)],
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 2,
                    width: 390,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 160,
                        height: 40,
                        child: Row(
                          children: [
                            Text("Line up Analysis"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check)],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check)],
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 2,
                    width: 390,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 160,
                        height: 40,
                        child: Row(
                          children: [
                            Text("Free AI Predictions"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 110,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check)],
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 2,
                    width: 390,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              width: 390,
              color: Color.fromARGB(255, 179, 206, 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 250,
                          height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Premium AI Pro Predicitons",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                      "Only Premium Pro subscribers can unlock the predictions wihth the premium Pro label for free Premium users and free users must pay"))
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "images/test.jpg",
                        width: 120,
                        height: 120,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: Text(
                "\"Auto-renewal Service Agreement\"",
                style: TextStyle(decoration: TextDecoration.underline,color: Colors.green,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text("\"Terms of service\"",
                      style: TextStyle(decoration: TextDecoration.underline,color: Colors.green,fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: Text("\"Privacy Policy\"",
                      style: TextStyle(decoration: TextDecoration.underline,color: Colors.green,fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

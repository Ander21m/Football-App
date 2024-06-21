import 'package:flutter/material.dart';
import 'package:footballcustom/MainPages/Utility/utility.dart';

class FAQPage extends StatelessWidget {
  FAQPage({super.key});
  final List<Map<String, String>> faqlist = [
    {
      "What is a Football?":
          """Association football, more commonly known as football or 
soccer,[a] is a team sport played between two teams of 11 
players each, who primarily use their feet to propel a ball 
around a rectangular field called a pitch. The objective of 
the game is to score more goals than the opposing team 
by moving the ball beyond the goal line into a rectangular-
framed goal defended by the opposing team."""
    },
    {
      "What is this App?":
          """This is an app that is responsive,fast and user friendly football app.The app allows the people get the live score of the matches."""
    },
    {
      "How to purchase premium?":
          """The user can easily purchase the premium by going to the premium page by clicking the premium from the drawer and filling the require information."""
    },
    {
      "What is the advantages of having premimum?":
          """The premium package allows the user get the news faster as well as some of the stastics and importants preview of the respective match.The user can also enjoy some of the premium only cool features"""
    },
    {
      "Why images aren't loading":
          """1.The user can check if the network is on or not.

2.The user can clear the client cahce in the side bar [Settings] > [Clear Cache].

3.The user can clear the phone memory & shutdown and restart.

4.If the problem is still there the user can take the screenshot and contact the development team by going to [Feedback] and report the problem."""
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility().getNormalAppBar(),
      body: Container(
        child: Column(
          children: faqlist.map((faq) {
            return ExpansionTile(
              title: (Text(faq.keys.toList()[0])),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Color.fromARGB(255, 202, 200, 200),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(faq.values.toList()[0]),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

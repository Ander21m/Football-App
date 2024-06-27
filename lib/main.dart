import 'package:flutter/material.dart';

import 'package:footballcustom/DrawerPages/faq.dart';
import 'package:footballcustom/DrawerPages/feedback.dart';
import 'package:footballcustom/DrawerPages/language.dart';
import 'package:footballcustom/DrawerPages/premium.dart';

import 'package:footballcustom/firstscreen.dart';

import 'MainPages/FollowPage.dart';
import 'MainPages/MatchPage.dart';
import 'MainPages/StatsPage.dart';
import 'MainPages/Utility/utility.dart';
import 'MainPages/homepage.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  List<Widget> pageWidgets = [
    const HomePage(),
    const matchPage(),
    const followPage(),
    const statsPage(),
  ];

  void onBottomTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      appBar: Utility().giveSuitableAppBar(_pageIndex, _scaffoldKey),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 179, 49),
              ),
              child: Text(
                'Football Live',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.blue,
              ),
              
              title: const Text(
                'Language',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 1 action here
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return LanguagePage();
                })); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 2 action here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_grocery_store_outlined,
                color: Colors.amber,
              ),
              title: const Text(
                'Preminum',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 2 action here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PremiumPage();
                  },
                )); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: Colors.indigo,
              ),
              title: const Text(
                'Feedback',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 2 action here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const FeedbackPage();
                  },
                )); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer_rounded,
                color: Colors.red,
              ),
              title: const Text(
                'FAQ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 2 action here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return FAQPage();
                  },
                )); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.thumb_up_alt_rounded,
                color: Colors.green,
              ),
              title: const Text(
                'Rate us',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 2 action here
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: pageWidgets[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_soccer,
                size: 20,
              ),
              label: "Match"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 20,
              ),
              label: "Follow"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                size: 20,
              ),
              label: "Stats"),
        ],
        currentIndex: _pageIndex,
        onTap: onBottomTap,
      ),
    );
  }
}

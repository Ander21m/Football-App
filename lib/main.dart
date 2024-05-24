import 'package:flutter/material.dart';
import 'package:footballcustom/Pages/FollowPage.dart';
import 'package:footballcustom/Pages/Utility/utility.dart';
import 'package:footballcustom/Pages/homePage.dart';
import 'package:footballcustom/Pages/MatchPage.dart';
import 'package:footballcustom/Pages/StatsPage.dart';
import 'package:footballcustom/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
                'Drawer Header',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            ListTile(
              onTap: () {
                // Add your item 1 action here
                Navigator.pop(context); // Close the drawer
              },
              title: const Text(
                'Item 1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              
            ),
            ListTile(
              title: const Text(
                'Item 2',
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

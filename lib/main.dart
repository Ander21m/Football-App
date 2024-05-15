import 'package:flutter/material.dart';
import 'package:footballcustom/Pages/FollowPage.dart';
import 'package:footballcustom/Pages/HomePage.dart';
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
    return MaterialApp(
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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _pageIndex = 0;

  List<Widget> pageWidgets = [
    const homePage(),
    const matchPage(),
    const followPage(),
    const statsPage()
  ];

  void onBottomTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Football",
          style: TextStyle(
              color: Color.fromARGB(255, 55, 184, 59),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 204, 204),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 179, 49),
              ),
            ),
            ListTile(
              title: Text(
                'Item 1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onTap: () {
                // Add your item 1 action here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text(
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


          color: const Color.fromARGB(255, 80, 198, 84)),



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

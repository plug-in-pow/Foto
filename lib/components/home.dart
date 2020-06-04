import 'package:flutter/material.dart';

// <- Dependencies ->
import 'package:google_nav_bar/google_nav_bar.dart';
// <- Dependencies ->

// <- Screens ->
import 'package:smart_ai_captioner/components/home_page.dart';
import 'package:smart_ai_captioner/components/search_page.dart';
import 'package:smart_ai_captioner/components/setting_page.dart';
// <- Screens ->

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.indigo,
                color: Colors.grey[600],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 600),
                textStyle: TextStyle(
                    fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                tabBackgroundColor: Colors.transparent,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ai_captioner/transition/fade_into.dart';
import 'package:smart_ai_captioner/components/intro_page/intro_screen.dart';
import 'package:smart_ai_captioner/components/home.dart';

class SplashState extends StatefulWidget {
  @override
  _SplashStateState createState() => _SplashStateState();
}

class _SplashStateState extends State<SplashState> {
  // This will navigate the user based on
  // whether the user had seen the first sreen on not.
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(context, FadeRoute(page: Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(context, FadeRoute(page: IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset('assets/logo.png')),
        ],
      ),
    );
  }
}

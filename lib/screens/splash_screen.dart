// lib/screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
//  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ListScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  Future<bool> checkLogin() async {
    // Check if the user is already logged in
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] isLogin: " + isLogin.toString());
    return isLogin;
  }

  @override
  void initState() {
    super.initState();  /*
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');  
    }); */
    Timer(Duration(seconds: 2), () {
      moveScreen();
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//            CircularProgressIndicator(),
//            SizedBox(height: 20),
            Text('Loading...(Splash Screen)', style: TextStyle(fontSize: 20)),
            Text('My Schedule Manager', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
 /*
 The  SplashScreen  widget is a  StatefulWidget  that displays a loading indicator and a message while the app is loading. The  initState  method is called when the widget is created. In this method, we use the  Future.delayed  method to wait for 2 seconds before navigating to the login screen. 
 The  build  method returns a  Scaffold  widget with a  Center  widget that contains a  Column  widget. The  Column  widget contains a  CircularProgressIndicator  widget and a  Text  widget. 
 Step 4: Create the Login Screen 
 Create a new file named  login_screen.dart  in the  lib/screens  directory and add the following code:   */
 // Path: lib/screens/login_screen.dart
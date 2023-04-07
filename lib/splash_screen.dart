import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playground_test/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int _currentIndex = 0;
  int _currentCharIndex = 0;

  final List<String> _overview = ["Days","Weeks","Months"];

  void typeWritingAnimation(){
    if(_currentCharIndex < _overview[_currentIndex].length){
      _currentCharIndex++;
    }else{
      _currentIndex = (_currentIndex+1)% _overview.length;
      _currentCharIndex = 0;
    }
    setState(() {});
    Future.delayed(const Duration(milliseconds: 400),(){
      typeWritingAnimation();
    });
  }




  @override
  void initState() {
    super.initState();
    typeWritingAnimation();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: "Hello")));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Text(
          _overview[_currentIndex].substring(0,_currentCharIndex),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 36, color: Colors.black),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/Screens/game/game.dart';
import 'package:tictactoe/domain/appcolor.dart';
import 'package:tictactoe/widgets/Uihelper.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Gamescreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.scaffoldbackgroundcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          UiHelper.CustomImage(img: "Tic_tac_toe.svg.png"),
        ],),
      ),
    );
  }
}
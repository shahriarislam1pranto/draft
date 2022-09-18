
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviesapp/main.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState() {

     super.initState();
     _navigatetohome();
  }
_navigatetohome()async{
  await Future.delayed(const Duration(milliseconds: 3000), () {});
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const Home()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0xFF90CAF9),Color(0xFFD500F9),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "images/chinema.png",
                  height: 300.0,
                  width: 300.0,
                ),
                const Text("Just Wait  For Some Seconeds \nLet's Go 👉 ",
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),

              ],
            ),

            const CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}


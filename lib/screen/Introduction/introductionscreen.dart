import 'package:allia/demo/demo.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 30, left: 20),
        child: SafeArea(
          child: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            animationDuration: 1000,

            pages: [
              PageViewModel(
                titleWidget: const Text(
                  "Allia - Fabric Design Companion",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 72, 131),
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                bodyWidget: const Text(
                  "choose your desired Template",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 9, 52, 87)),
                ),
                image: Image.asset("assets/first.png"),
              ),
              PageViewModel(
                titleWidget: const Text(
                  "Allia - Fabric Design Companion",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 72, 131),
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                bodyWidget: const Text(
                  "Choose your desired Template",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 9, 52, 87)),
                ),
                image: Image.asset("assets/second.png"),
              ),
              PageViewModel(
                titleWidget: const Text(
                  "Allia - Fabric Design Companion",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 72, 131),
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                bodyWidget: const Text(
                  "Realistic Fabric Draping",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 9, 52, 87)),
                ),
                image: Image.asset("assets/third.png"),
              ),
            ],
            onDone: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            onSkip: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            }, // You can override onSkip callback
            showSkipButton: true,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: false,
            //rtl: true, // Display as right-to-left
            back: const Icon(Icons.arrow_back),
            skip: const Text('Skip',
                style: TextStyle(fontWeight: FontWeight.w600)),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done',
                style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),

            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

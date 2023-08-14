import 'package:allia/screen/Introduction/introductionscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo/demo.dart';
import 'model/model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool(
        'showHome',
      ) ??
      false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryWiseImagesProvider(),
      child: MaterialApp(
          theme: ThemeData(),
          home: AnimatedSplashScreen(
            splash: const Image(
                image: AssetImage(
              "assets/allia.png",
            )),
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: const Color.fromARGB(255, 4, 71, 125),
            nextScreen: showHome ? const Home() : const Introduction(),
          )),
    );
  }
}

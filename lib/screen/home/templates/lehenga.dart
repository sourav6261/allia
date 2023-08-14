import 'package:flutter/material.dart';

class Lehenga extends StatefulWidget {
  const Lehenga({super.key});

  @override
  State<Lehenga> createState() => _LehengaState();
}

class _LehengaState extends State<Lehenga> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 490,
              width: MediaQuery.of(context).size.width / 1.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/IMG_5334.PNG"),
                    fit: BoxFit.cover),
              )
              // child: Image.asset("assets/IMG_5335.PNG"),
              ),
          // Column(
          //   children: [
          //     WidgetMask(
          //       childSaveLayer: true,
          //       mask: Container(
          //         height: 100,
          //         child: Image.asset(
          //           "assets/IMG_5334.PNG",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       child: Container(
          //         height: 500,
          //         width: MediaQuery.of(context).size.width / 1.5,
          //         child: TweenAnimationBuilder<double>(
          //           builder: (context, value, child) {
          //             return Transform.scale(
          //               scale: value,
          //               child: child,
          //             );
          //           },
          //           tween: Tween(begin: 1, end: _scale),
          //           duration: Duration(milliseconds: 160),
          //           child: Stack(
          //             alignment: Alignment.center,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(18.0),
          //                 child: Container(
          //                   height: 100,
          //                   child: Image.asset(
          //                     "assets/1_thumb.jpeg",
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),

          //     // Container(
          //     //   width: 400,
          //     //   decoration: BoxDecoration(
          //     //     color: Colors.white.withOpacity(0.3),
          //     //     borderRadius: BorderRadius.circular(25),
          //     //     border: Border.all(
          //     //         width: 2, color: Color.fromARGB(144, 255, 255, 255)),
          //     //   ),
          //     //   child: Slider.adaptive(
          //     //     inactiveColor: Colors.white,
          //     //     activeColor: Colors.white54,
          //     //     value: _scale,
          //     //     max: 29,
          //     //     min: 1,
          //     //     onChanged: (value) {
          //     //       setState(() {
          //     //         _scale = value;
          //     //       });
          //     //     },
          //     //   ),
          //     // )
          //   ],
          // ),
        ],
      ),
    );
  }
}

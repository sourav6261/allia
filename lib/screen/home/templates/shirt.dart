import 'package:flutter/material.dart';

class Shirt extends StatefulWidget {
  const Shirt({super.key});

  @override
  State<Shirt> createState() => _ShirtState();
}

class _ShirtState extends State<Shirt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                height: 490,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/IMG_5335.PNG"),
                      fit: BoxFit.cover),
                )
                // child: Image.asset("assets/IMG_5335.PNG"),
                ),
          ],
        ),
      ],
    );
  }
}

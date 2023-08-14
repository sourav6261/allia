import 'package:flutter/material.dart';

class Mask extends StatefulWidget {
  const Mask({super.key});

  @override
  State<Mask> createState() => _MaskState();
}

class _MaskState extends State<Mask> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: 490,
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/IMG_5336.PNG"),
                      fit: BoxFit.cover),
                )
                // child: Image.asset("assets/IMG_5335.PNG"),
                ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}

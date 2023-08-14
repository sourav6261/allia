import 'package:flutter/material.dart';

class Blazer extends StatelessWidget {
  const Blazer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width / 1.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

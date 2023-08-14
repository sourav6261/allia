import 'dart:io';

import 'package:allia/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryImageRow extends StatelessWidget {
  final String category;
  final Function() onTap;

  const CategoryImageRow(
      {super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryWiseImagesProvider>(context);
    var imagePath = provider.categoryImageMap[category];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(''),
        // const SizedBox(height: 8),
        imagePath != null
            ? InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: FileImage(File(imagePath)),
                ),
              )
            : const Center(
                child: Text(''),
              ),
      ],
    );
  }
}

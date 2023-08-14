import 'package:allia/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPopup extends StatelessWidget {
  const CategoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryWiseImagesProvider>(context);
    return AlertDialog(
      title: const Text('Select Category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var category in provider.categories)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(category);
              },
              child: Text(category),
            ),
        ],
      ),
    );
  }
}

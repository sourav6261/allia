import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryWiseImagesProvider extends ChangeNotifier {
  Map<String, String> categoryImageMap = {};

  List<String> categories = [
    'Zara Satin',
    'Rayon Print',
    'Embroidery',
    'Luxury crepe',
    'Handwork',
  ];

  Future<void> loadCategoryWiseImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var category in categories) {
      String? imagePath = prefs.getString(category);
      if (imagePath != null) {
        categoryImageMap[category] = imagePath;
      }
    }
    notifyListeners();
  }

  void addImageToCategory(String imagePath, String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(category, imagePath);
    categoryImageMap[category] = imagePath;
    notifyListeners();
  }

////////////////////////////////////////////////////////////
  double imageX = 0.0;
  double imageY = 0.0;
  double stepSize = 10.0;

  void moveImage(double dx, double dy) {
    imageX += dx;
    imageY += dy;
    notifyListeners();
  }
}

class ContainerPosition with ChangeNotifier {
  double containerX = 0.0;
  double containerY = 0.0;
  double stepSize = 10.0;

  void moveContainer(double dx, double dy) {
    containerX += dx;
    containerY += dy;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////
  double _scale = 4.0;

  double get scale => _scale;

  void setScale(double value) {
    _scale = value;
    notifyListeners();
  }
}

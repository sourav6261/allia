// import 'dart:io';

// import 'package:allia_app/model/model.dart';
// import 'package:allia_app/screen/home/templates/blazer.dart';
// import 'package:allia_app/screen/home/templates/lehenga.dart';
// import 'package:allia_app/screen/home/templates/mask.dart';
// import 'package:allia_app/screen/home/templates/pent.dart';
// import 'package:allia_app/screen/home/templates/shirt.dart';
// import 'package:allia_app/screen/home/templates/widgets/custom_text.dart';
// import 'package:allia_app/screen/home/templates/widgets/im.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   File? image;
//   String? _selectedImagePath;
//   // var scale = 5.3;
//   // double _sliderValue = 50.0;
//   double _zoom = 1.0;
//   double _previousZoom = 1.0;
//   Offset _offset = Offset.zero;
//   Offset _previousOffset = Offset.zero;
//   Offset _startingFocalPoint = Offset.zero;
//   double imageX = 0.0;
//   double imageY = 0.0;
//   double stepSize = 10.0;
//   void moveImage(double dx, double dy) {
//     setState(() {
//       imageX += dx;
//       imageY += dy;
//     });
//   }

//   void _handleScaleStart(ScaleStartDetails details) {
//     _startingFocalPoint = details.focalPoint;
//     _previousOffset = _offset;
//     _previousZoom = _zoom;
//   }

//   void _handleScaleUpdate(ScaleUpdateDetails details) {
//     setState(() {
//       if (details.scale != 1.0) {
//         _zoom = (_previousZoom * details.scale).clamp(0.8, 2.0);
//         final Offset normalizedOffset =
//             (_startingFocalPoint - _previousOffset) / _previousZoom;
//         _offset = details.focalPoint - normalizedOffset * _zoom;
//       }
//     });
//   }

//   double dx = 0.0;
//   double dy = 0.0;
//   double maxDistance = 10.0; // Maximum distance from the center

//   void _onPanUpdate(DragUpdateDetails details) {
//     setState(() {
//       Offset position = details.localPosition;

//       // Calculate the vector from the center of the joystick
//       Offset delta = position - const Offset(0, 0);

//       // Calculate the distance from the center
//       double distance = delta.distance;

//       // Normalize the vector if it's outside the maximum distance
//       if (distance > maxDistance) {
//         delta = delta / distance * maxDistance;
//       }

//       // Update the joystick position
//       dx = delta.dx;
//       dy = delta.dy;
//     });
//     setState(() {
//       imageX += dx;
//       imageY += dy;
//     });
//   }

//   void _onPanEnd(DragEndDetails details) {
//     setState(() {
//       // Reset the joystick position when released
//       dx = 0.0;
//       dy = 0.0;
//     });
//   }

//   int indegx = 2;
//   final items = [
//     SizedBox(
//       height: 30,
//       width: 30,
//       child: Image.asset("assets/shirt.png"),
//     ),
//     SizedBox(
//       height: 30,
//       width: 30,
//       child: Image.asset("assets/pant.png"),
//     ),
//     SizedBox(
//       height: 30,
//       width: 30,
//       child: Image.asset("assets/mask.png"),
//     ),
//     SizedBox(
//       height: 30,
//       width: 30,
//       child: Image.asset("assets/blazer.png"),
//     ),
//     SizedBox(
//       height: 30,
//       width: 30,
//       child: Image.asset("assets/lehenga.png"),
//     ),
//   ];
//   int index = 0;
//   int indexw = 0;

//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<CategoryWiseImagesProvider>(context);
//     provider.loadCategoryWiseImages(); // Load images on screen load

//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         items: items,
//         index: index,
//         onTap: (selctedIndex) {
//           setState(() {
//             index = selctedIndex;
//           });
//         },
//         height: 70,
//         backgroundColor: Colors.white,
//         color: Colors.grey,
//       ),
//       // backgroundColor: Colors.grey[400],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () async {
//                         await Share.share("This is");
//                       },
//                       child: SizedBox(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width / 11,
//                         child: const Image(
//                           image: AssetImage("assets/share.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 13,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(25),
//                           child: Container(
//                             // height: MediaQuery.of(context).size.height / 2,
//                             width: MediaQuery.of(context).size.width / 8,
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 255, 255, 255)
//                                   .withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(
//                                   width: 2,
//                                   color: const Color.fromARGB(0, 210, 15, 15)),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 InkWell(
//                                   onTap: () => _openCameraAndSaveImage(context),
//                                   child: CircleAvatar(
//                                     backgroundColor: const Color(0x00d9d9d9),
//                                     child: SizedBox(
//                                       width:
//                                           MediaQuery.of(context).size.width / 9,
//                                       child: Image(
//                                           image: const AssetImage(
//                                             "assets/solar_camera-bold.png",
//                                           ),
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height /
//                                               9,
//                                           width: MediaQuery.of(context)
//                                               .size
//                                               .width),
//                                     ),
//                                   ),
//                                 ),
//                                 const Text(
//                                   "Upload",
//                                   style: TextStyle(fontSize: 10),
//                                 ),
//                                 ////////////////////////
//                                 Padding(
//                                   padding: const EdgeInsets.all(6.0),
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         for (var category
//                                             in provider.categories)
//                                           CategoryImageRow(
//                                             category: category,
//                                             onTap: () =>
//                                                 _showSelectedCategoryImage(
//                                                     context, category),
//                                           ),
//                                         // SizedBox(height: 20),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 /////////////////////////////////////
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onPanUpdate: (details) {
//                         moveImage(details.delta.dx, details.delta.dy);
//                       },
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           GestureDetector(
//                             onScaleStart: _handleScaleStart,
//                             onScaleUpdate: _handleScaleUpdate,
//                             child: ClipRect(
//                               child: Transform(
//                                 transform: Matrix4.identity()
//                                   ..translate(_offset.dx, _offset.dy)
//                                   ..scale(_zoom),
//                                 child: Column(
//                                   children: [
//                                     if (_selectedImagePath != null)
//                                       Transform.translate(
//                                         offset: Offset(imageX, imageY),
//                                         child: Container(
//                                           height: 480,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width /
//                                               1.5,
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: FileImage(
//                                                     File(_selectedImagePath!)),
//                                                 fit: BoxFit.fitHeight),
//                                           ),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           getSelectedWidget(index: index),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width / 8.3,
//                       height: MediaQuery.of(context).size.height / 3.3,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(25),
//                         border: Border.all(
//                             width: 2,
//                             color: const Color.fromARGB(144, 255, 255, 255)),
//                       ),
//                       child: Column(
//                         children: [
//                           RotatedBox(
//                             quarterTurns: -1,
//                             child: Slider.adaptive(
//                               inactiveColor: Colors.white,
//                               activeColor: Colors.white54,
//                               value: _zoom,
//                               min: 1,
//                               max: 2.0,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _zoom = value.clamp(0.8, 2.0);
//                                 });
//                               },
//                               label: _zoom.toStringAsFixed(2),
//                             ),
//                           ),
//                           GestureDetector(
//                             onPanUpdate: (details) {
//                               moveImage(details.delta.dx, details.delta.dy);
//                             },
//                             child: Center(
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white30,
//                                         borderRadius:
//                                             BorderRadius.circular(30)),
//                                   ),
//                                   GestureDetector(
//                                     onPanUpdate: _onPanUpdate,
//                                     onPanEnd: _onPanEnd,
//                                     child: GestureDetector(
//                                       child: Container(
//                                         width: 15,
//                                         height: 15,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white,
//                                         ),
//                                         child: Transform.translate(
//                                           offset: Offset(dx, dy),
//                                           child: Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.blue[200],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) return;

//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image = imageTemporary;
//       });
//     } on PlatformException catch (e) {
//       // print("Error:$e");
//     }
//   }

//   Widget getSelectedWidget({required int index}) {
//     Widget widget;
//     switch (index) {
//       case 0:
//         widget = const Shirt();
//         break;

//       case 1:
//         widget = const Pent();
//         break;

//       case 2:
//         widget = const Mask();
//         break;

//       case 3:
//         widget = const Blazer();
//         break;

//       case 4:
//         widget = const Lehenga();
//         break;

//       default:
//         widget = const Shirt();
//         break;
//     }
//     return widget;
//   }

//   void _openCameraAndSaveImage(BuildContext context) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? imageFile =
//         await picker.pickImage(source: ImageSource.gallery);
//     if (imageFile != null) {
//       // Show the category popup after taking the picture
//       String? selectedCategory = await showDialog<String>(
//         context: context,
//         builder: (context) => CategoryPopup(),
//       );

//       // Save the image in the selected category
//       if (selectedCategory != null) {
//         Provider.of<CategoryWiseImagesProvider>(context, listen: false)
//             .addImageToCategory(imageFile.path, selectedCategory);
//       }
//     }
//   }

//   void _showSelectedCategoryImage(BuildContext context, String category) {
//     var provider =
//         Provider.of<CategoryWiseImagesProvider>(context, listen: false);
//     var imagePath = provider.categoryImageMap[category];

//     setState(() {
//       _selectedImagePath = imagePath;
//     });
//   }
// }

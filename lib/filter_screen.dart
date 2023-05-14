import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gps_replica/second_screen.dart';
import 'dart:ui' as ui;

import './filters.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final GlobalKey _globalKey = GlobalKey();
  final List<List<double>> filters = [
    sepium,
    sepia,
    greyScale,
    vintage,
    filter_1,
    filter_2,
    filter_3,
    filter_4,
    filter_5
  ];

  void convertWidgetToImage() async {
    RenderRepaintBoundary repaintBoundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    final byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
    final unit8list = byteData!.buffer.asUint8List();
    Navigator.of(_globalKey.currentContext!).push(
      MaterialPageRoute(
        builder: (context) => SecondScreen(imageData: unit8list),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Filters"),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            onPressed: convertWidgetToImage,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: screenSize.height,
              maxWidth: screenSize.width,
            ),
            child: PageView.builder(
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return ColorFiltered(
                  //  Below is the filter for getting grey scale image.
                  colorFilter: ColorFilter.matrix(filters[index]),
                  child: Image.asset(
                    'assets/images/test.jpg',
                    width: screenSize.width,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

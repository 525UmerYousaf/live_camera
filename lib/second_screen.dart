// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final Uint8List imageData;
  const SecondScreen({
    Key? key,
    required this.imageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: screenSize.height,
            maxWidth: screenSize.width,
          ),
          child: Image.memory(
            imageData,
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

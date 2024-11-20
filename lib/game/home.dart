import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadBackgroundImage(),
      builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
  body: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: snapshot.data!, // Set the first image as background
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.conejo), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.lente), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.bigote), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.sombrero), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.bufanda), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 250, // Adjust position as needed
        right: -25,
        child: Container(
          width: 450, // Set the width of the second image
          height: 450, // Set the height of the second image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.zanahoria), // Your second image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  ),
);

        }
      },
    );
  }

  Future<ImageProvider> _loadBackgroundImage() async {
    final image = await Flame.images.load(Assets.fondo);
    return MemoryImage(
      (await image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List(),
    );
  }
}

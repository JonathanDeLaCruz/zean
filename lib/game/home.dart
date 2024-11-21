import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/misiones.dart';

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
                // Fondo
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Nivelador
                Positioned(
                  top: 20,
                  left: 20,
                  child: const LevelIndicator(),
                ),
                // Imágenes adicionales
                ..._buildImages(),
              ],
            ),
          );
        }
      },
    );
  }

  List<Widget> _buildImages() {
    final images = [
      Assets.conejo,
      Assets.lente,
      Assets.bigote,
      Assets.sombrero,
      Assets.bufanda,
      Assets.zanahoria,
    ];
    final double screenWidth = WidgetsBinding.instance.window.physicalSize.width /
    WidgetsBinding.instance.window.devicePixelRatio;

    return images
        .asMap()
        .entries
        .map(
          (entry) => Positioned(
            top: 230, // Incremento para separación opcional
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(entry.value),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  Future<ImageProvider> _loadBackgroundImage() async {
    final image = await Flame.images.load(Assets.fondo);
    return MemoryImage(
      (await image.toByteData(format: ImageByteFormat.png))!
          .buffer
          .asUint8List(),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la vista de MisionesPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MisionesPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF53746E),
          borderRadius: BorderRadius.circular(12),
        ),
        height: MediaQuery.of(context).size.width * .2,
        width: MediaQuery.of(context).size.width - 30,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: const Icon(
                Icons.person,
                color: Colors.brown,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "NIVEL 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "NIVEL 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: 0.9,
                      backgroundColor: Colors.grey[400],
                      color: Colors.yellow[700],
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
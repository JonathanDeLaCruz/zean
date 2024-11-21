import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class Menu extends StatelessWidget {
  final List<Map<String, String>> breakfastItems = [
    {
      'title': 'Fruta fresca',
      'subtitle': 'Fresas, sandía, melón y papaya',
      'image': Assets.uno,
    },
    {
      'title': 'Huevos rancheros',
      'subtitle': 'Huevos, tomate, tortilla y queso',
      'image': Assets.dos,
    },
    {
      'title': 'Panqueques de avena',
      'subtitle': 'Harina, huevo, mantequilla y avena',
      'image': Assets.tres,
    },
    // Agrega más elementos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desayunos"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "MEJORES RECOMENDACIONES\nDE DESAYUNO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de columnas
                  crossAxisSpacing: 16.0, // Espacio horizontal entre elementos
                  mainAxisSpacing: 16.0, // Espacio vertical entre elementos
                  childAspectRatio: 0.7, // Relación de aspecto de las tarjetas
                ),
                itemCount: breakfastItems.length,
                itemBuilder: (context, index) {
                  final item = breakfastItems[index];
                  return _buildBreakfastCard(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                    imagePath: item['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakfastCard({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

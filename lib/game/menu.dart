import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class Menu extends StatelessWidget {
  final List<Map<String, String>> breakfastItems = [
    {
      'title': 'Fruta fresca',
      'subtitle': 'Fresas, sandía, melón y papaya',
      'image': Assets.fruta,
    },
    {
      'title': 'Huevos rancheros',
      'subtitle': 'Huevos, tomate, tortilla y queso',
      'image': Assets.huevo,
    },
    {
      'title': 'Panqueques de avena',
      'subtitle': 'Harina, huevo, mantequilla y avena',
      'image': Assets.panqueques,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Desayunos",
          style: TextStyle(color: Colors.black),
        ),
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
              "MEJORES RECOMENDACIONES DE DESAYUNO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2, // 3 columnas en tablets, 2 en móviles
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75, // Proporción de los cards
                ),
                itemCount: breakfastItems.length,
                itemBuilder: (context, index) {
                  final item = breakfastItems[index];
                  return _buildBreakfastCard(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                    imagePath: item['image']!,
                    isTablet: isTablet,
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
    required bool isTablet,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título con fondo redondeado
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 18 : 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Subtítulo descriptivo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isTablet ? 16 : 12,
                color: Colors.teal,
              ),
            ),
          ),
          const Spacer(),
          // Imagen ocupando la parte inferior
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: isTablet ? 160 : 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Menu(),
  ));
}

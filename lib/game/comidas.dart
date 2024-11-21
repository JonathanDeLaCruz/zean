import 'package:flutter/material.dart';

class ComidasPage extends StatelessWidget {
  const ComidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Control de comidas",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "CONTROL DE COMIDAS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Botones de categorías
              _buildCategoryButton("DESAYUNOS", Icons.free_breakfast),
              const SizedBox(height: 10),
              _buildCategoryButton("COMIDAS", Icons.lunch_dining),
              const SizedBox(height: 10),
              _buildCategoryButton("CENAS", Icons.dinner_dining),
              const SizedBox(height: 10),
              _buildCategoryButton("SNACKS", Icons.fastfood),
              const SizedBox(height: 30),

              // Lista de comidas del día
              const Center(
                child: Text(
                  "LISTA DE COMIDAS DEL DÍA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "20 de noviembre del 2024",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    _FoodItem(text: "Enchiladas verdes"),
                    SizedBox(height: 10),
                    _FoodItem(text: "Panqueques de avena"),
                    SizedBox(height: 10),
                    _FoodItem(text: "Salmón a la parrilla"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Botón de añadir
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para añadir comida
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53746E),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Añadir",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        // Acción para cada categoría
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodItem extends StatelessWidget {
  final String text;

  const _FoodItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ComidasPage(),
  ));
}

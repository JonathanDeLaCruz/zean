import 'package:flutter/material.dart';
import 'package:zean/game/menu.dart';

class ComidasPage extends StatelessWidget {
  const ComidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Control de comidas",
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 24 : 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal
              Center(
                child: Text(
                  "CONTROL DE COMIDAS",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Botones de categorías
              _buildCategoryButton(
                "DESAYUNOS",
                Icons.free_breakfast,
                Icons.free_breakfast,
                isTablet,
                context,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildCategoryButton(
                "COMIDAS",
                Icons.lunch_dining,
                Icons.lunch_dining,
                isTablet,
                context,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildCategoryButton(
                "CENAS",
                Icons.dinner_dining,
                Icons.dinner_dining,
                isTablet,
                context,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildCategoryButton(
                "SNACKS",
                Icons.fastfood,
                Icons.fastfood,
                isTablet,
                context,
              ),
              SizedBox(height: isTablet ? 40 : 30),

              // Lista de comidas del día
              Center(
                child: Text(
                  "LISTA DE COMIDAS DEL DÍA",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 20 : 10),
              Center(
                child: Text(
                  "20 de noviembre del 2024",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Card de lista de comidas
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
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
              SizedBox(height: isTablet ? 30 : 20),

              // Botón de añadir
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para añadir comida
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53746E),
                    padding: EdgeInsets.symmetric(
                      vertical: isTablet ? 20 : 16,
                      horizontal: isTablet ? 40 : 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Añadir",
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      String title, IconData leftIcon, IconData rightIcon, bool isTablet, context) {
    return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Menu(),
        ),
      );
    },
      child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isTablet ? 20 : 16,
        horizontal: isTablet ? 30 : 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(leftIcon, color: const Color.fromARGB(255, 1, 1, 1), size: isTablet ? 36 : 24),
          Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Icon(rightIcon, color: const Color.fromARGB(255, 0, 0, 0), size: isTablet ? 36 : 24),
        ],
      ),
    ),
    );
  }
}

class _FoodItem extends StatelessWidget {
  final String text;

  const _FoodItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isTablet ? 12 : 8,
        horizontal: isTablet ? 24 : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isTablet ? 18 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
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

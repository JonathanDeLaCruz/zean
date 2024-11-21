import 'package:flutter/material.dart';

class GlucosaPage extends StatelessWidget {
  const GlucosaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtén las dimensiones de la pantalla
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: isTablet ? 35 : 25,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: isTablet ? 40 : 32,
                    ),
                  ),
                  Text(
                    "NIVEL DE GLUCOSA",
                    style: TextStyle(
                      fontSize: isTablet ? 24 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.orange,
                    size: isTablet ? 40 : 32,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Círculo del nivel de glucosa
              Container(
                width: isTablet ? 200 : 150,
                height: isTablet ? 200 : 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellow,
                    width: isTablet ? 6 : 4,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "100\nmg/dL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 32 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Cuadrícula de indicadores secundarios
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos elementos por fila
                  mainAxisSpacing: 16, // Espacio entre filas
                  crossAxisSpacing: 16, // Espacio entre columnas
                  childAspectRatio: 2.5, // Ajusta el tamaño de los cuadros
                ),
                children: [
                  _buildIndicatorCard(
                    title: "Oxigenación",
                    value: "95%",
                    description: "Tus niveles de oxigenación",
                    progressValue: 0.95,
                    progressColor: Colors.blue,
                    isTablet: isTablet,
                  ),
                  _buildIndicatorCard(
                    title: "Presión",
                    value: "120/80",
                    description: "Tus niveles de presión",
                    progressValue: 0.75,
                    progressColor: Colors.red,
                    isTablet: isTablet,
                  ),
                  _buildIndicatorCard(
                    title: "Horas de sueño",
                    value: "2 horas",
                    description: "Tus horas de sueño",
                    progressValue: 0.2,
                    progressColor: Colors.red,
                    isTablet: isTablet,
                  ),
                  _buildIndicatorCard(
                    title: "Ritmo Cardíaco",
                    value: "79 LPM",
                    description: "Tus niveles de ritmo cardíaco",
                    progressValue: 0.79,
                    progressColor: Colors.blueGrey,
                    isTablet: isTablet,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Gráfico de glucosa
              Text(
                "Registro de Glucosa",
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: isTablet ? 300 : 200,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Gráfico de Glucosa (Simulado)",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorCard({
    required String title,
    required String value,
    required String description,
    required double progressValue,
    required Color progressColor,
    required bool isTablet,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 18 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            color: progressColor,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: isTablet ? 20 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: isTablet ? 14 : 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: GlucosaPage(),
  ));
}

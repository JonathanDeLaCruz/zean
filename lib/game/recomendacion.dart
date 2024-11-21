import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class RecomendacionPage extends StatelessWidget {
  final int id;

  const RecomendacionPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    // Datos de prueba estáticos (puedes reemplazarlos según el id en el futuro)
    final String titulo = "RECOMENDACIÓN SOBRE DIETA";
    final String descripcion =
        "No existe una dieta o un plan de comidas específico que funcione para todos. Es posible que su profesional de la salud le pida que consulte con un dietista registrado o un educador en diabetes que pueda ayudarle a diseñar el mejor plan de alimentación para usted. El plan considerará:";
    final List<String> puntos = [
      "Cualquier medicamento que tome",
      "Su peso",
      "Cualquier otra afección de salud que tenga",
      "Su estilo de vida y gustos",
      "Sus metas",
    ];
    final String pregunta = "¿Qué alimentos debo consumir si tengo diabetes?";
    final String respuesta =
        "Comer los alimentos adecuados para la diabetes significa comer una variedad de alimentos saludables de todos los grupos de alimentos.";
    final String iconPath = Assets.uno;
    final String imagePath = Assets.dieta;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Recomendaciones",
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
          child: Container(
            padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icono y título
                Row(
                  children: [
                    CircleAvatar(
                      radius: isTablet ? 40 : 30,
                      backgroundImage: AssetImage(iconPath), // Ruta a tu imagen
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        titulo,
                        style: TextStyle(
                          fontSize: isTablet ? 22 : 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Descripción
                Text(
                  descripcion,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                // Lista de puntos
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: puntos
                      .map((punto) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "• $punto",
                              style: TextStyle(
                                fontSize: isTablet ? 16 : 14,
                                color: Colors.black87,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 30),

                // Imagen
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      imagePath, // Ruta a la imagen de dieta
                      fit: BoxFit.cover,
                      height: isTablet ? 400 : 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Pregunta y respuesta
                Text(
                  pregunta,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  respuesta,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RecomendacionPage(id: 1), // Envía un ID de prueba
  ));
}

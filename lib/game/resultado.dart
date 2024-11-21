import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final int puntos;
  final String estado;
  final String descripcion;
  final Color color;

  const ResultadoPage({
    Key? key,
    required this.puntos,
    required this.estado,
    required this.descripcion,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Encuesta",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Resultado de puntos
            Container(
              width: isTablet ? size.width * 0.8 : size.width * 0.9,
              padding: EdgeInsets.symmetric(vertical: isTablet ? 24 : 16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "RESULTADO: $puntos PUNTOS",
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Estado del control
            Container(
              width: isTablet ? size.width * 0.8 : size.width * 0.9,
              padding: EdgeInsets.all(isTablet ? 24 : 16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    estado,
                    style: TextStyle(
                      fontSize: isTablet ? 22 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descripcion,
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Conejo con cuadro de diálogo
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: isTablet ? -20 : -15,
                  left: isTablet ? 100 : 50,
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 20 : 12),
                    width: isTablet ? 300 : 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Text(
                      "Nunca es tarde para iniciar un control adecuado de tu diabetes. Zenulin te ayudará con eso",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/conejo.png', // Ruta del conejo
                    width: isTablet ? 200 : 150,
                    height: isTablet ? 200 : 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResultadoPage(
      puntos: 11,
      estado: "CONTROL DEFICIENTE",
      descripcion:
          "El usuario presenta síntomas frecuentes, falta de monitoreo y/o poca adherencia al tratamiento. Requiere intervención inmediata.",
      color: Colors.red,
    ),
  ));
}

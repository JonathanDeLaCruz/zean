import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class EncuestaAviso extends StatelessWidget {
  const EncuestaAviso({Key? key}) : super(key: key);

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
          "Encuesta",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tarjeta de mensaje
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFBEE4E1), // Color similar al mostrado
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  const Text(
                    "Gracias por tomarte el tiempo de contestar la encuesta. En Zenulin nos preocupamos por tu salud y queremos llevar un control adecuado para darte la mejor atención",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar a la siguiente página o funcionalidad
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA726), // Color del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "COMENZAR",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Imagen del conejo
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  Assets.conejo, // Ruta a tu imagen del conejo
                  width: 450,
                  height: 450,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 0,
                  right: 40,
                  child: Column(
                    children: [
                      _buildBubble(12),
                      const SizedBox(height: 8),
                      _buildBubble(20),
                      const SizedBox(height: 8),
                      _buildBubble(28),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFBEE4E1),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EncuestaAviso(),
  ));
}

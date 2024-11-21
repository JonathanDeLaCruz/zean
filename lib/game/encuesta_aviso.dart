import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';

class EncuestaAviso extends StatelessWidget {
  const EncuestaAviso({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Encuesta",
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tarjeta de mensaje
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32.0 : 16.0,
                ),
                padding: EdgeInsets.all(isTablet ? 30.0 : 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFBEE4E1), // Color similar al mostrado
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Text(
                      "Gracias por tomarte el tiempo de contestar la encuesta. En Zenulin nos preocupamos por tu salud y queremos llevar un control adecuado para darte la mejor atención",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isTablet ? 18 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Navegar a la siguiente página o funcionalidad
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA726), // Color del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 48 : 32,
                          vertical: isTablet ? 16 : 12,
                        ),
                      ),
                      child: Text(
                        "COMENZAR",
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Imagen del conejo con burbujas decorativas
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    Assets.conejo, // Ruta a tu imagen del conejo
                    width: isTablet ? 500 : 300,
                    height: isTablet ? 500 : 300,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: isTablet ? 10 : 0,
                    right: isTablet ? 60 : 40,
                    child: Column(
                      children: [
                        _buildBubble(isTablet ? 20 : 12),
                        const SizedBox(height: 8),
                        _buildBubble(isTablet ? 28 : 20),
                        const SizedBox(height: 8),
                        _buildBubble(isTablet ? 36 : 28),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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

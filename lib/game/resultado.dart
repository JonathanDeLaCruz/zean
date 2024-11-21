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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Resultado de puntos
              SizedBox(
                width: double.infinity, // Ocupa el 100% del ancho disponible
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "RESULTADO: $puntos PUNTOS",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Estado del control
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      estado,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      descripcion,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Mensaje y conejo
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Nunca es tarde para iniciar un control adecuado de tu diabetes. Zenulin te ayudará con eso",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/conejo.png', // Ruta a la imagen del conejo
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ],
          ),
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

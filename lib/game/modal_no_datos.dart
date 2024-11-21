import 'package:flutter/material.dart';
import 'package:zean/game/registro.dart';

class ModalNoDatos {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Permite cerrar el modal al hacer clic fuera
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "NO HAY DATOS REGISTRADOS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Para acceder a esta sección necesitas registrar los datos necesarios",
                style: TextStyle(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el modal actual
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const RegistroPage(), // Redirige a RegistroPage3
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53746E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "REGISTRAR",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

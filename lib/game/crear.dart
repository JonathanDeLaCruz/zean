import 'package:flutter/material.dart';
import 'package:zean/game/informacion.dart';

class CrearPage extends StatelessWidget {
  const CrearPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isTablet ? 70 : 50),

              // Logo
              Container(
                width: isTablet ? 300 : 200,
                height: isTablet ? 150 : 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Título
              Text(
                "CREAR CUENTA",
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Campos de entrada
              _buildInputField(
                label: "Nombre de usuario",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildInputField(
                label: "Correo electrónico",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildInputField(
                label: "Confirmar correo electrónico",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildInputField(
                label: "Contraseña",
                obscureText: true,
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildInputField(
                label: "Confirmar contraseña",
                obscureText: true,
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Botón Crear
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InformacionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53746E),
                    padding: EdgeInsets.symmetric(
                      vertical: isTablet ? 20 : 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Crear",
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 20 : 10),

              // Botón Cancelar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Regresa a la pantalla anterior
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                      vertical: isTablet ? 20 : 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Cancelar",
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

  Widget _buildInputField({
    required String label,
    bool obscureText = false,
    required bool isTablet,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: isTablet ? 20 : 16,
          horizontal: isTablet ? 20 : 16,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CrearPage(),
  ));
}
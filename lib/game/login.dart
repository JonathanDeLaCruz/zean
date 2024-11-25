import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 32.0 : 16.0,
            vertical: isTablet ? 40.0 : 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Espaciado superior
              SizedBox(height: isTablet ? 60 : 30),

              // Logo
              Container(
                width: double.infinity,
                height: isTablet ? 150 : 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                width: isTablet ? 300 : 80,
                height: isTablet ? 300 : 80,
                fit: BoxFit.contain,
              ),
              ),
              SizedBox(height: isTablet ? 40 : 20),

              // Título
              Text(
                "INICIAR SESIÓN",
                style: TextStyle(
                  fontSize: isTablet ? 26 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: isTablet ? 40 : 20),

              // Campos de entrada
              _buildInputField(
                label: "Usuario",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 20 : 10),
              _buildInputField(
                label: "Contraseña",
                obscureText: true,
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 40 : 20),

              // Botón Iniciar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para iniciar sesión
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Iniciar",
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 20 : 10),

              // Texto para registro
              GestureDetector(
                onTap: () {
                  // Lógica para "No tengo cuenta"
                },
                child: Text(
                  "No tengo cuenta",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.teal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 20 : 10),

              // Botón Crear cuenta
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a Crear cuenta
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
                    "Crear cuenta",
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 40 : 20),

              // Conejo y mensaje
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(isTablet ? 16.0 : 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "BIENVENIDO A NUESTRA APP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: isTablet ? 20 : 10),
                  Image.asset(
                    'assets/images/conejo.png',
                    width: isTablet ? 300 : 80,
                    height: isTablet ? 300 : 80,
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
    home: LoginPage(),
  ));
}

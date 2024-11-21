import 'package:flutter/material.dart';
import 'package:zean/game/login.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

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
          "Perfil de usuario",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar e información del usuario
              Column(
                children: [
                  CircleAvatar(
                    radius: isTablet ? 70 : 50,
                    backgroundColor: Colors.orange[100],
                    child: Icon(
                      Icons.person,
                      size: isTablet ? 100 : 80,
                      color: Colors.orange[800],
                    ),
                  ),
                  SizedBox(height: isTablet ? 20 : 10),
                  Text(
                    "KRYS PERALTA",
                    style: TextStyle(
                      fontSize: isTablet ? 28 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: isTablet ? 10 : 5),
                  Text(
                    "CURP: GAPK020408MTCRRRA0",
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Información detallada
              Container(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _ProfileInfo(label: "NSS", value: "57170248660"),
                    _ProfileInfo(
                      label: "NOMBRE",
                      value: "KRYSTELL GUADALUPE GARCIA PERALTA",
                    ),
                    _ProfileInfo(label: "SEXO", value: "MUJER"),
                    _ProfileInfo(label: "FECHA DE NACIMIENTO", value: "08/04/2002"),
                    _ProfileInfo(label: "LUGAR DE NACIMIENTO", value: "TABASCO"),
                    _ProfileInfo(label: "TIPO DE SANGRE", value: "O POSITIVO"),
                  ],
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Opciones adicionales
              _SettingsOption(
                title: "Ajustes de estilo de vida",
                destination: const LoginPage(),
                isTablet: isTablet,
              ),
              _SettingsOption(
                title: "Ajustes de privacidad",
                destination: const LoginPage(),
                isTablet: isTablet,
              ),
              _SettingsOption(
                title: "Añadir contacto",
                destination: const LoginPage(),
                isTablet: isTablet,
              ),
              _SettingsOption(
                title: "Cerrar sesión",
                destination: const LoginPage(),
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Footer
              Column(
                children: [
                  Text(
                    "Zenulin, seguimiento de diabetes\nVersión 1.0.0\n©2024 Zenulin.Inc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 16 : 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: isTablet ? 20 : 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Políticas de privacidad",
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 12,
                          color: Colors.teal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: isTablet ? 30 : 20),
                      Text(
                        "Condiciones de uso",
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 12,
                          color: Colors.teal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
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

class _ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileInfo({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: "$label:\n",
          style: TextStyle(
            fontSize: isTablet ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: isTablet ? 18 : 14,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsOption extends StatelessWidget {
  final String title;
  final Widget destination;
  final bool isTablet;

  const _SettingsOption({
    Key? key,
    required this.title,
    required this.destination,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(isTablet ? 20.0 : 16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isTablet ? 18 : 14,
                  color: Colors.black87,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PerfilPage(),
  ));
}

import 'package:flutter/material.dart';
import 'package:zean/game/contactos.dart';
import 'package:zean/game/encuesta_aviso.dart';
import 'package:zean/game/login.dart';
import 'package:zean/game/privacidad.dart';
import 'package:zean/game/vida.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

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
          "Perfil de usuario",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar e información del usuario
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.orange[100],
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.orange[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "KRYS PERALTA",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "CURP: GAPK020408MTCRRRA0",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Información detallada
              Container(
                padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 20),

              // Opciones adicionales
              _SettingsOption(title: "Ajustes de estilo de vida", destination: VidaPage(),),
              _SettingsOption(title: "Ajustes de privacidad", destination: PrivacidadPage(),),
              _SettingsOption(title: "Añadir contacto", destination: ContactosPage(),),
              _SettingsOption(title: "Cerrar sesión", destination: LoginPage(),),
              const SizedBox(height: 20),

              // Footer
              Column(
                children: const [
                  Text(
                    "Zenulin, seguimiento de diabetes\nVersión 1.0.0\n©2024 Zenulin.Inc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Políticas de privacidad",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.teal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Condiciones de uso",
                        style: TextStyle(
                          fontSize: 12,
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

  const _ProfileInfo({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: "$label:\n",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 14,
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
  final Widget destination; // Nueva propiedad para la pantalla de destino

  const _SettingsOption({Key? key, required this.title, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          // Navegación a la pantalla de destino
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
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

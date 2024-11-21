import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Perfil de usuario",
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 24 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de avatar e información del usuario
            Row(
              children: [
                CircleAvatar(
                  radius: isTablet ? 60 : 50,
                  backgroundColor: const Color(0xFFDEF3F1),
                  child: Icon(
                    Icons.person,
                    size: isTablet ? 80 : 60,
                    color: const Color(0xFF067D68),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "KRYS PERALTA",
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFA726),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "CURP: GAPK020408MTCRRRA0",
                      style: TextStyle(
                        fontSize: isTablet ? 18 : 14,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Card de información detallada del usuario
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isTablet ? 24 : 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProfileInfo(label: "NSS", value: "57170248660"),
                  ProfileInfo(
                    label: "NOMBRE",
                    value: "KRYSTELL GUADALUPE GARCIA PERALTA",
                  ),
                  ProfileInfo(label: "SEXO", value: "MUJER"),
                  ProfileInfo(label: "FECHA DE NACIMIENTO", value: "08/04/2002"),
                  ProfileInfo(label: "LUGAR DE NACIMIENTO", value: "TABASCO"),
                  ProfileInfo(label: "TIPO DE SANGRE", value: "O POSITIVO"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Card de opciones
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isTablet ? 20 : 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SettingsOption(
                    title: "Ajustes de estilo de vida",
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                    isTablet: isTablet,
                  ),
                  const Divider(),
                  SettingsOption(
                    title: "Ajustes de privacidad",
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                    isTablet: isTablet,
                  ),
                  const Divider(),
                  SettingsOption(
                    title: "Añadir contacto",
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                    isTablet: isTablet,
                  ),
                  const Divider(),
                  SettingsOption(
                    title: "Cerrar sesión",
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                    isTablet: isTablet,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Footer
            Column(
              children: [
                Text(
                  "Zenulin, seguimiento de diabetes\nVersión 1.0.0\n©2024 Zenulin.Inc",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 12,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Políticas de privacidad",
                      style: TextStyle(
                        fontSize: isTablet ? 16 : 12,
                        color: const Color(0xFF067D68),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "Condiciones de uso",
                      style: TextStyle(
                        fontSize: isTablet ? 16 : 12,
                        color: const Color(0xFF067D68),
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
    );
  }
}

// Widget reutilizable para información del usuario
class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({Key? key, required this.label, required this.value})
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
            color: const Color(0xFF067D68),
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: isTablet ? 18 : 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable para opciones dentro de una card
class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isTablet;

  const SettingsOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: isTablet ? 12 : 8,
        horizontal: isTablet ? 24 : 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: isTablet ? 18 : 14,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(
        icon,
        size: isTablet ? 18 : 16,
        color: const Color(0xFF067D68),
      ),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PerfilPage(),
  ));
}
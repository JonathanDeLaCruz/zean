import 'package:flutter/material.dart';

class PrivacidadPage extends StatelessWidget {
  const PrivacidadPage({Key? key}) : super(key: key);

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
          "Privacidad",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CURP section
            _buildInfoCard(
              label: "CURP",
              value: "GAPK020408MTCRRRA0",
              onTap: () {
                // Lógica para copiar el CURP
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("CURP copiado al portapapeles")),
                );
              },
            ),
            const SizedBox(height: 16),

            // Correo y Teléfono section
            _buildEditableCard(
              email: "KRYSTELLGARCIA0804@GMAIL.COM",
              phone: "9933750225",
              onEditEmail: () {
                // Lógica para editar correo
              },
              onEditPhone: () {
                // Lógica para editar teléfono
              },
            ),
            const SizedBox(height: 16),

            // Opciones de privacidad
            _buildOptionTile(
              context,
              title: "Solicitar información",
              onTap: () {
                // Lógica para navegar a "Solicitar información"
              },
            ),
            _buildOptionTile(
              context,
              title: "Gestionar los consentimientos",
              onTap: () {
                // Lógica para navegar a "Gestionar los consentimientos"
              },
            ),
            _buildOptionTile(
              context,
              title: "Eliminar cuenta",
              onTap: () {
                // Lógica para navegar a "Eliminar cuenta"
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity, // Asegura que ocupe todo el ancho disponible
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$label:",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Pulse para copiar",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCard({
    required String email,
    required String phone,
    required VoidCallback onEditEmail,
    required VoidCallback onEditPhone,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Correo:",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onEditEmail,
                child: const Text(
                  "Editar",
                  style: TextStyle(fontSize: 14, color: Colors.teal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 16),

          // Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Teléfono:",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onEditPhone,
                child: const Text(
                  "Editar",
                  style: TextStyle(fontSize: 14, color: Colors.teal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            phone,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PrivacidadPage(),
  ));
}

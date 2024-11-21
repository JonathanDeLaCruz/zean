import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FamiliarPage extends StatefulWidget {
  const FamiliarPage({Key? key}) : super(key: key);

  @override
  State<FamiliarPage> createState() => _FamiliarPageState();
}

class _FamiliarPageState extends State<FamiliarPage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController parentescoController = TextEditingController();
  final TextEditingController titularController = TextEditingController();

  @override
  void dispose() {
    // Libera los controladores al salir de la pantalla
    nombreController.dispose();
    telefonoController.dispose();
    parentescoController.dispose();
    titularController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Registro de contacto",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "REGISTRO DE CONTACTO",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Campos de texto
            _buildInputField(
              controller: nombreController,
              label: "Nombre:",
              hint: "Nombre del contacto por agregar",
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: telefonoController,
              label: "Número de teléfono:",
              hint: "Número telefónico de 10 dígitos",
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: parentescoController,
              label: "Parentesco:",
              hint: "Parentesco del contacto con el usuario",
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: titularController,
              label: "Usuario titular:",
              hint: "Nombre del titular",
            ),
            const SizedBox(height: 40),

            // Botón Guardar
            _buildActionButton(
              label: "Guardar",
              color: const Color(0xFF53746E),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Contacto guardado")),
                );
              },
            ),
            const SizedBox(height: 10),

            // Botón Generar QR
            _buildActionButton(
              label: "Generar QR",
              color: Colors.orange,
              icon: Icons.qr_code,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRGeneratorPage(
                      data: {
                        'nombre': nombreController.text,
                        'telefono': telefonoController.text,
                        'parentesco': parentescoController.text,
                        'titular': titularController.text,
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: icon == null
            ? Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}

class QRGeneratorPage extends StatelessWidget {
  final Map<String, String> data;

  const QRGeneratorPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String qrData =
        data.entries.map((entry) => '${entry.key}: ${entry.value}').join('\n');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Código QR"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: QrImageView( // Usa QrImageView si QrImage no funciona
          data: qrData, // Datos para el QR
          version: QrVersions.auto, // Ajuste automático de versión
          size: 200.0, // Tamaño del QR
          backgroundColor: Colors.white, // Fondo blanco
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Contacto guardado")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53746E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Guardar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Botón Escanear
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final qrResult = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScannerPage(),
                    ),
                  );

                  if (qrResult != null) {
                    final Map<String, dynamic> data =
                        Map<String, dynamic>.from(qrResult);

                    // Prerellena los campos
                    setState(() {
                      nombreController.text = data['nombre'];
                      telefonoController.text = data['telefono'];
                      parentescoController.text = data['parentesco'];
                      titularController.text = data['titular'];
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Formulario prerellenado")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53746E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      "Escanear",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Botón Generar QR
            Center(
              child: SizedBox(
                width: double.infinity, // Hace que el botón ocupe todo el ancho
                child: ElevatedButton(
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.qr_code, // Icono de QR
                    color: Colors.white,
                    size: 24, // Ajusta el tamaño del icono según sea necesario
                  ),
                ),
              ),
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
}

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((scanData) {
            controller.pauseCamera();
            Navigator.pop(context, scanData.code);
          });
        },
      ),
    );
  }
}

class QRGeneratorPage extends StatelessWidget {
  final Map<String, String> data;

  const QRGeneratorPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Código QR"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: QrImageView(
          data: data.toString(),
          version: QrVersions.auto,
          size: 200.0,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

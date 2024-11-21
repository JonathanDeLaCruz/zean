import 'package:flutter/material.dart';

class InformacionPage extends StatelessWidget {
  const InformacionPage({Key? key}) : super(key: key);

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
          "COMPLETAR INFORMACIÓN",
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
            children: [
              // Campos de entrada
              _buildInputField(label: "Nombre", hint: "Nombre"),
              const SizedBox(height: 10),
              _buildInputField(label: "Apellido paterno", hint: "Apellido paterno"),
              const SizedBox(height: 10),
              _buildInputField(label: "Apellido materno", hint: "Apellido materno"),
              const SizedBox(height: 10),
              _buildInputField(label: "Fecha de nacimiento:", hint: "-- / -- / --"),
              const SizedBox(height: 10),
              _buildInputField(label: "CURP", hint: "CURP"),
              const SizedBox(height: 10),
              _buildInputField(label: "NSS", hint: "NSS"),
              const SizedBox(height: 10),

              // Fila para Género y Sangre
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(label: "Genero"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField(label: "Sangre"),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Estado
              _buildDropdownField(label: "Estado"),
              const SizedBox(height: 10),

              // Fila para Altura y Peso
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(label: "Altura"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField(label: "Peso"),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Fila para Glucosa normal y Glucosa ayuno
              Row(
                children: [
                  Expanded(
                    child: _buildInputField(label: "Glucosa normal", hint: ""),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildInputField(label: "Glucosa ayuno", hint: ""),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Alergias
              _buildInputField(label: "Alergias", hint: ""),
              const SizedBox(height: 10),

              // Tipo de diabetes y Horas de sueño
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(label: "Tipo de diabetes"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField(label: "Horas de sueño"),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Consumo de agua y Frecuencia de actividad física
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(label: "Cuantos litros de agua consume:"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField(label: "Frecuencia de actividad física:"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Botón Siguiente
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica al presionar el botón
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Información enviada")),
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
                    "Siguiente",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, required String hint}) {
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

  Widget _buildDropdownField({required String label}) {
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: const [
                DropdownMenuItem(value: "1", child: Text("Opción 1")),
                DropdownMenuItem(value: "2", child: Text("Opción 2")),
              ],
              onChanged: (value) {
                // Acción al cambiar la selección
              },
              hint: const Text("Seleccione una opción"),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: InformacionPage(),
  ));
}

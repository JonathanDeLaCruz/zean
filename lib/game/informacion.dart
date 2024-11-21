import 'package:flutter/material.dart';
import 'package:zean/main.dart';

class InformacionPage extends StatefulWidget {
  const InformacionPage({Key? key}) : super(key: key);

  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

class _InformacionPageState extends State<InformacionPage> {
  // Estados para los valores seleccionados en los Dropdowns
  String? generoSeleccionado;
  String? sangreSeleccionada;
  String? estadoSeleccionado;
  String? alturaSeleccionada;
  String? pesoSeleccionado;
  String? tipoDiabetesSeleccionada;
  String? horasSuenoSeleccionada;
  String? litrosAguaSeleccionados;
  String? frecuenciaActividadSeleccionada;

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
              _buildInputField(label: "Nombre", hint: "Nombre"),
              const SizedBox(height: 10),
              _buildInputField(
                  label: "Apellido paterno", hint: "Apellido paterno"),
              const SizedBox(height: 10),
              _buildInputField(
                  label: "Apellido materno", hint: "Apellido materno"),
              const SizedBox(height: 10),
              _buildInputField(
                  label: "Fecha de nacimiento", hint: "-- / -- / --"),
              const SizedBox(height: 10),
              _buildInputField(label: "CURP", hint: "CURP"),
              const SizedBox(height: 10),
              _buildInputField(label: "NSS", hint: "NSS"),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Genero",
                items: const ["Masculino", "Femenino", "Otro"],
                selectedValue: generoSeleccionado,
                onChanged: (value) {
                  setState(() {
                    generoSeleccionado = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Sangre",
                items: const ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"],
                selectedValue: sangreSeleccionada,
                onChanged: (value) {
                  setState(() {
                    sangreSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Estado",
                items: const ["Tabasco", "Chiapas", "Veracruz", "Campeche"],
                selectedValue: estadoSeleccionado,
                onChanged: (value) {
                  setState(() {
                    estadoSeleccionado = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Altura",
                items: const ["150 cm", "160 cm", "170 cm", "180 cm", "190 cm"],
                selectedValue: alturaSeleccionada,
                onChanged: (value) {
                  setState(() {
                    alturaSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Peso",
                items: const ["50 kg", "60 kg", "70 kg", "80 kg", "90 kg"],
                selectedValue: pesoSeleccionado,
                onChanged: (value) {
                  setState(() {
                    pesoSeleccionado = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildInputField(label: "Glucosa normal", hint: ""),
              const SizedBox(height: 10),
              _buildInputField(label: "Glucosa ayuno", hint: ""),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Tipo de diabetes",
                items: const ["Tipo 1", "Tipo 2", "Gestacional"],
                selectedValue: tipoDiabetesSeleccionada,
                onChanged: (value) {
                  setState(() {
                    tipoDiabetesSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Horas de sueño",
                items: const [
                  "4 horas",
                  "5 horas",
                  "6 horas",
                  "7 horas",
                  "8 horas"
                ],
                selectedValue: horasSuenoSeleccionada,
                onChanged: (value) {
                  setState(() {
                    horasSuenoSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Litros de agua consumidos",
                items: const ["1 litro", "2 litros", "3 litros", "4 litros"],
                selectedValue: litrosAguaSeleccionados,
                onChanged: (value) {
                  setState(() {
                    litrosAguaSeleccionados = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: "Frecuencia de actividad física",
                items: const ["Diaria", "Semanal", "Mensual", "Rara vez"],
                selectedValue: frecuenciaActividadSeleccionada,
                onChanged: (value) {
                  setState(() {
                    frecuenciaActividadSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyApp(), // Clase principal que contiene los tabs
                      ),
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

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: double.infinity, // Fuerza a ocupar el ancho completo
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: onChanged,
                hint: const Text("Seleccione una opción"),
              ),
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
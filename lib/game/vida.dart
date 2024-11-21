import 'package:flutter/material.dart';

class VidaPage extends StatelessWidget {
  const VidaPage({Key? key}) : super(key: key);

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
          "Estilo de vida",
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
          children: [
            _buildEditableInfoCard(
              title: "TIEMPO NORMAL DE SUEÑO",
              value: "8 HORAS",
              description: "La mayoría de las personas necesitan de 7 a 9 horas de sueño",
              onEdit: () {
                // Lógica para editar tiempo de sueño
              },
            ),
            const SizedBox(height: 16),
            _buildEditableInfoCard(
              title: "CONSUMO DE AGUA NORMAL",
              value: "2 LITROS",
              description: "Una persona promedio bebe 2 L de agua al día",
              onEdit: () {
                // Lógica para editar consumo de agua
              },
            ),
            const SizedBox(height: 16),
            _buildEditableInfoCard(
              title: "ALTURA",
              value: "160 CM",
              description: "",
              onEdit: () {
                // Lógica para editar altura
              },
            ),
            const SizedBox(height: 16),
            _buildEditableInfoCard(
              title: "PESO",
              value: "60 KG",
              description: "Se usará tu altura y peso para calcular tu Índice de Masa Corporal",
              onEdit: () {
                // Lógica para editar peso
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableInfoCard({
    required String title,
    required String value,
    required String description,
    required VoidCallback onEdit,
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
          // Título y botón Editar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: const Text(
                  "Editar",
                  style: TextStyle(fontSize: 14, color: Colors.teal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Valor principal
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),

          // Descripción adicional
          if (description.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: VidaPage(),
  ));
}

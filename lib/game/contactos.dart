import 'package:flutter/material.dart';
import 'package:zean/game/familiar.dart';

class ContactosPage extends StatelessWidget {
  const ContactosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contactos = [
      {"nombre": "Juan Choco"},
      {"nombre": "Cristian Herrera"},
      {"nombre": "Dr. Ismar"},
      {"nombre": "Yesenia Del C."},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Lista de contactos",
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
            const Center(
              child: Text(
                "LISTA DE CONTACTOS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contactos.length,
                itemBuilder: (context, index) {
                  final contacto = contactos[index];
                  return _buildContactCard(
                    context,
                    nombre: contacto["nombre"]!,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Acción para agregar un nuevo contacto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FamiliarPage(), // Asegúrate de tener CrearPage implementado
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.teal,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, {required String nombre}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              nombre,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Acción al presionar el icono de información
              print("Información de $nombre");
            },
            child: const Icon(
              Icons.info,
              color: Colors.teal,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ContactosPage(),
  ));
}

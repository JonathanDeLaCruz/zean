import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/contactos.dart';
import 'package:zean/game/encuesta_aviso.dart';
import 'package:zean/game/familiar.dart';
import 'package:zean/game/misiones.dart';
import 'package:zean/game/notificaciones.dart';
import 'package:zean/game/perfil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showMessage = true; // Cambia a false para ocultar el mensaje

    return FutureBuilder(
      future: _loadBackgroundImage(),
      builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            body: Stack(
              children: [
                // Fondo
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Nivelador
                Positioned(
                  top: 20,
                  left: 20,
                  child: const LevelIndicator(),
                ),
                // Imágenes adicionales
                ..._buildImages(context),
                if (showMessage) // Mostrar globo solo si la condición es true
                  Positioned.fill(
                    top: -300,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Tarjeta de mensaje
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFBEE4E1), // Color del globo
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Responde la encuesta sobre diabetes que aparece a continuación. Si decides no hacerlo, el anuncio permanecerá visible, pero podrás seguir usando la app normalmente.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EncuestaAviso(), // Asegúrate de tener CrearPage implementado
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                          0xFF53746E), // Color del botón
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: const Text(
                                      "RESPONDER",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton(
                    heroTag: "contacts",
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ContactosPage(), // Asegúrate de tener CrearPage implementado
                        ),
                      );
                    },
                    child: const Icon(Icons.group, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    heroTag: "notifications",
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true, // Permitir ajuste completo de la pantalla
                        backgroundColor:
                            Colors.transparent, // Fondo transparente
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize:
                              0.9, // Tamaño inicial del modal (90% de la pantalla)
                          minChildSize:
                              0.5, // Tamaño mínimo al arrastrar (50% de la pantalla)
                          maxChildSize:
                              1.0, // Tamaño máximo (100% de la pantalla)
                          builder: (context, scrollController) => Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[100], // Fondo azul claro
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                // Ícono de cierre en la esquina superior derecha
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.pop(context); // Cerrar el modal
                                    },
                                  ),
                                ),
                                // Título opcional

                                // Lista de imágenes
                                Expanded(
                                  child: GridView.count(
                                    controller:
                                        scrollController, // Permitir el scroll del modal
                                    crossAxisCount: 2, // Dos columnas
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    children: [
                                      _buildImageCard(Assets.bigote),
                                      _buildImageCard(Assets.lente),
                                      _buildImageCard(Assets.bufanda),
                                      _buildImageCard(Assets.sombrero),
                                      _buildEmptyCard(),
                                      _buildEmptyCard(),
                                      _buildEmptyCard(),
                                      _buildEmptyCard(),
                                      // Agrega más elementos aquí si es necesario
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.inbox, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  List<Widget> _buildImages(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final images = [
      Assets.conejo,
      Assets.lente,
      Assets.bigote,
      Assets.sombrero,
      Assets.bufanda,
      Assets.zanahoria,
    ];
    final double screenWidth =
        WidgetsBinding.instance.window.physicalSize.width /
            WidgetsBinding.instance.window.devicePixelRatio;

    return images
        .asMap()
        .entries
        .map(
          (entry) => Positioned(
            top: isTablet ? 500 : 230, // Ajusta según diseño
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(entry.value),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  Future<ImageProvider> _loadBackgroundImage() async {
    final image = await Flame.images.load(Assets.fondo);
    return MemoryImage(
      (await image.toByteData(format: ImageByteFormat.png))!
          .buffer
          .asUint8List(),
    );
  }

  Widget _buildBubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFBEE4E1),
      ),
    );
  }

  // Método para construir las tarjetas de imagen
  Widget _buildImageCard(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  // Método para construir las tarjetas vacías
  Widget _buildEmptyCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    return GestureDetector(
      onTap: () {
        // Navegar a la vista de MisionesPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MisionesPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF53746E),
          borderRadius: BorderRadius.circular(12),
        ),
        height: isTablet ? 100 : 60,
        width: MediaQuery.of(context).size.width - 30,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navegar a la vista de UserProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilPage(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  color: Colors.brown,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "NIVEL 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "NIVEL 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: 0.9,
                      backgroundColor: Colors.grey[400],
                      color: Colors.yellow[700],
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificacionesPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

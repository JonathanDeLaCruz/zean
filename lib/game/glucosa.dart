import 'package:flutter/material.dart';
import 'package:zean/game/modal_no_datos.dart';
import 'package:zean/game/notificaciones.dart';
import 'package:zean/game/perfil.dart';

class GlucosaPage extends StatelessWidget {
  const GlucosaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.
    if (true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ModalNoDatos.show(context); // Invoca el método estático de tu modal
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Encabezado
              CustomHeader(
                title: "NIVEL DE GLUCOSA",
                onAvatarTap: () {
                  // Navegar a la página de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PerfilPage(), // Implementa PerfilPage
                    ),
                  );
                },
                onNotificationTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const NotificacionesPage(), // Implementa PerfilPage
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),

              // Indicador decorativo del nivel de glucosa
              SizedBox(
                width: isTablet ? 300 : 250,
                height: isTablet ? 300 : 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Círculo decorativo
                    CustomPaint(
                      size: Size(isTablet ? 300 : 250, isTablet ? 300 : 250),
                      painter: GlucoseCirclePainter(),
                    ),
                    // Texto en el centro
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "100",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "mg/dL",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Cuadrícula de indicadores secundarios
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                children: [
                  _buildIndicatorCard(
                    title: "Oxigenación",
                    value: "95%",
                    description: "Tus niveles de oxigenación",
                    progressValue: 0.95,
                    progressColor: Colors.blue,
                  ),
                  _buildIndicatorCard(
                    title: "Presión",
                    value: "120/80",
                    description: "Tus niveles de presión",
                    progressValue: 0.75,
                    progressColor: Colors.red,
                  ),
                  _buildIndicatorCard(
                    title: "Horas de sueño",
                    value: "2 horas",
                    description: "Tus horas de sueño",
                    progressValue: 0.2,
                    progressColor: Colors.red,
                  ),
                  _buildIndicatorCard(
                    title: "Ritmo Cardíaco",
                    value: "79 LPM",
                    description: "Tus niveles de ritmo cardíaco",
                    progressValue: 0.79,
                    progressColor: Colors.blueGrey,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Gráfico de glucosa
              Text(
                "Registro de Glucosa",
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: isTablet ? 300 : 200,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Gráfico de Glucosa (Simulado)",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorCard({
    required String title,
    required String value,
    required String description,
    required double progressValue,
    required Color progressColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            color: progressColor,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class GlucoseCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintOuterCircle = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final paintInnerCircle = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;

    // Dibuja el círculo exterior
    canvas.drawCircle(center, radius, paintOuterCircle);

    // Dibuja el círculo interior
    canvas.drawCircle(center, radius - 10, paintInnerCircle);

    // Dibuja puntos decorativos
    final pointPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(center.dx + radius, center.dy), 5, pointPaint);
    canvas.drawCircle(Offset(center.dx - radius, center.dy), 5, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(const MaterialApp(
    home: GlucosaPage(),
  ));
}

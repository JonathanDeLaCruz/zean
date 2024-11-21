import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BluetoothHeartRatePage(),
    );
  }
}

class BluetoothHeartRatePage extends StatefulWidget {
  const BluetoothHeartRatePage({Key? key}) : super(key: key);

  @override
  _BluetoothHeartRatePageState createState() => _BluetoothHeartRatePageState();
}

class _BluetoothHeartRatePageState extends State<BluetoothHeartRatePage> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice? connectedDevice;
  List<BluetoothService> services = [];
  String heartRate = "Esperando datos...";

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    flutterBlue.startScan(timeout: const Duration(seconds: 10));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        print('Dispositivo encontrado: ${result.device.name}');
        if (result.device.name.isNotEmpty) {
          // Conectar al primer dispositivo con nombre
          _connectToDevice(result.device);
          flutterBlue.stopScan();
          break;
        }
      }
    });
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      setState(() {
        connectedDevice = device;
      });
      print('Conectado a ${device.name}');
      // Descubrir servicios
      services = await device.discoverServices();
      _listenToHeartRate();
    } catch (e) {
      print('Error al conectar: $e');
    }
  }

  void _listenToHeartRate() {
    for (BluetoothService service in services) {
      if (service.uuid.toString().toLowerCase().contains('180d')) {
        // UUID estándar de servicio de ritmo cardíaco
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.uuid.toString().toLowerCase().contains('2a37')) {
            // UUID estándar de característica de medición de ritmo cardíaco
            characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              if (value.isNotEmpty) {
                final bpm = value[1]; // Segundo byte contiene los BPM
                setState(() {
                  heartRate = '$bpm BPM';
                });
                print('Ritmo cardíaco: $bpm BPM');
              }
            });
          }
        }
      }
    }
  }

  Future<void> _disconnectFromDevice() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      setState(() {
        connectedDevice = null;
        services = [];
        heartRate = "Desconectado";
      });
      print('Desconectado del dispositivo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ritmo Cardíaco BLE'),
        actions: [
          if (connectedDevice != null)
            IconButton(
              icon: const Icon(Icons.bluetooth_disabled),
              onPressed: _disconnectFromDevice,
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ritmo cardíaco:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              heartRate,
              style: const TextStyle(fontSize: 32, color: Colors.teal),
            ),
            const SizedBox(height: 20),
            if (connectedDevice == null)
              const Text(
                'Escaneando dispositivos BLE...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )
            else
              Text(
                'Conectado a ${connectedDevice!.name}',
                style: const TextStyle(fontSize: 16, color: Colors.teal),
              ),
          ],
        ),
      ),
    );
  }
}

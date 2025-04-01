import 'package:flutter/material.dart';
import 'package:bncc_final_project/counter.dart';
import 'package:bncc_final_project/area.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({super.key});

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  final TextEditingController _sideController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();
  double _volume = 0.0;

  void _calculateCubicVolume() {
    final double side = double.tryParse(_sideController.text) ?? 0.0;
    setState(() {
      _volume = side * side * side;
    });
  }

  void _calculatePyramidVolume() {
    final double base = double.tryParse(_baseController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    setState(() {
      _volume = (1 / 3) * base * height;
    });
  }

  void _calculateCylinderVolume() {
    final double radius = double.tryParse(_radiusController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    setState(() {
      _volume = 3.14159 * radius * radius * height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calculate Volume of Cubic',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _sideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Side Length',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateCubicVolume,
              child: const Text('Calculate Cubic Volume'),
            ),
            const Divider(height: 30),
            const Text(
              'Calculate Volume of Pyramid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base Area',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculatePyramidVolume,
              child: const Text('Calculate Pyramid Volume'),
            ),
            const Divider(height: 30),
            const Text(
              'Calculate Volume of Cylinder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateCylinderVolume,
              child: const Text('Calculate Cylinder Volume'),
            ),
            const Divider(height: 30),
            Center(
                child: Text(
              'Volume: $_volume',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  double _area = 0.0;

  void _calculateTriangleArea() {
    final double base = double.tryParse(_baseController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    setState(() {
      _area = 0.5 * base * height;
    });
  }

  void _calculateSquareArea() {
    final double length = double.tryParse(_lengthController.text) ?? 0.0;
    setState(() {
      _area = length * length;
    });
  }

  void _calculateRectangleArea() {
    final double length = double.tryParse(_lengthController.text) ?? 0.0;
    final double width = double.tryParse(_widthController.text) ?? 0.0;
    setState(() {
      _area = length * width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calculate Area of Triangle',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base',
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
              onPressed: _calculateTriangleArea,
              child: const Text('Calculate Triangle Area'),
            ),
            const Divider(height: 30),
            const Text(
              'Calculate Area of Square',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _lengthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Length',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateSquareArea,
              child: const Text('Calculate Square Area'),
            ),
            const Divider(height: 30),
            const Text(
              'Calculate Area of Rectangle',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _lengthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Length',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Width',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateRectangleArea,
              child: const Text('Calculate Rectangle Area'),
            ),
            const Divider(height: 30),
            Center(
              child: Text(
                'Area: $_area',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

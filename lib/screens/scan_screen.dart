import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Camera View\n(Placeholder)',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Arahkan kamera ke barcode produk'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate scan result
                Navigator.pop(context, '123456789'); // Return barcode
              },
              child: const Text('Simulasi Scan'),
            ),
          ],
        ),
      ),
    );
  }
}

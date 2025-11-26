import 'package:flutter/material.dart';

class AIRecognitionScreen extends StatelessWidget {
  const AIRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengenalan Produk AI')),
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
                  'Camera View\n(AI Recognition)',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Arahkan kamera ke produk untuk identifikasi otomatis'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate AI recognition
                Navigator.pop(context, {
                  'name': 'Indomie Goreng',
                  'price': 3000.0,
                });
              },
              child: const Text('Simulasi Pengenalan'),
            ),
          ],
        ),
      ),
    );
  }
}

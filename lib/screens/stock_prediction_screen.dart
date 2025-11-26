import 'package:flutter/material.dart';

class StockPredictionScreen extends StatelessWidget {
  const StockPredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder predictions
    final predictions = [
      {
        'product': 'Indomie Goreng',
        'current': 50,
        'predicted': 30,
        'recommendation': 'Restock 20 pcs',
      },
      {
        'product': 'Susu Ultra',
        'current': 5,
        'predicted': 15,
        'recommendation': 'Restock 10 pcs',
      },
      {
        'product': 'Kopi Kapal Api',
        'current': 20,
        'predicted': 25,
        'recommendation': 'Sufficient',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Prediksi Kebutuhan Stok')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Prediksi berdasarkan riwayat penjualan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  final pred = predictions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pred['product'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Stok saat ini: ${pred['current']}'),
                          Text('Prediksi kebutuhan: ${pred['predicted']}'),
                          const SizedBox(height: 8),
                          Text(
                            'Rekomendasi: ${pred['recommendation']}',
                            style: TextStyle(
                              color:
                                  (pred['recommendation'] as String).contains(
                                    'Restock',
                                  )
                                  ? Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Send restock notifications
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifikasi restock dikirim!')),
                );
              },
              child: const Text('Kirim Notifikasi Restock'),
            ),
          ],
        ),
      ),
    );
  }
}

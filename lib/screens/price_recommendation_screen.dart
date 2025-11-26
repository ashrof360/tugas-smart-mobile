import 'package:flutter/material.dart';

class PriceRecommendationScreen extends StatelessWidget {
  const PriceRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder recommendations
    final recommendations = [
      {
        'product': 'Indomie Goreng',
        'currentPrice': 3000,
        'marketAvg': 2800,
        'recommended': 3200,
        'margin': 15,
        'fastMoving': true,
      },
      {
        'product': 'Susu Ultra',
        'currentPrice': 5000,
        'marketAvg': 4800,
        'recommended': 5500,
        'margin': 20,
        'fastMoving': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Rekomendasi Harga Pintar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rekomendasi harga berdasarkan pasar dan margin keuntungan',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  final rec = recommendations[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                rec['product'] as String,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                (rec['fastMoving'] as bool)
                                    ? Icons.trending_up
                                    : Icons.trending_down,
                                color: (rec['fastMoving'] as bool)
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Harga saat ini: Rp ${rec['currentPrice']}'),
                          Text('Rata-rata pasar: Rp ${rec['marketAvg']}'),
                          Text(
                            'Rekomendasi: Rp ${rec['recommended']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text('Margin keuntungan: ${rec['margin']}%'),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Apply recommendation
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Harga ${rec['product']} diperbarui!',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Terapkan'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

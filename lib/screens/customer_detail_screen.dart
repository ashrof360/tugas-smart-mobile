import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> customer;

  const CustomerDetailScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    // Placeholder transaction history
    final transactions = [
      {'date': '2024-01-01', 'amount': 25000, 'points': 25},
      {'date': '2024-01-05', 'amount': 15000, 'points': 15},
      {'date': '2024-01-10', 'amount': 30000, 'points': 30},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(customer['name'] as String)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customer['name'] as String,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Phone: ${customer['phone']}'),
                    Text('Email: ${customer['email'] ?? 'N/A'}'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                          'Poin Loyalty: ${customer['points']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Riwayat Transaksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final trans = transactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text('Rp ${trans['amount']}'),
                      subtitle: Text('Tanggal: ${trans['date']}'),
                      trailing: Text('+${trans['points']} poin'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Send promo notification
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Promo dikirim ke pelanggan!')),
                );
              },
              child: const Text('Kirim Promo'),
            ),
          ],
        ),
      ),
    );
  }
}

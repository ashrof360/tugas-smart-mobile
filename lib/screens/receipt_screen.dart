import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final total = args['total'] as double;
    final payment = args['payment'] as String;

    // Placeholder cart items
    final cart = [
      {'name': 'Indomie Goreng', 'price': 3000.0, 'quantity': 2},
      {'name': 'Susu Ultra', 'price': 5000.0, 'quantity': 1},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Struk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'KASIR CERDAS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(child: Text('Jl. Contoh No. 123')),
            const Center(child: Text('Tel: 08123456789')),
            const Divider(),
            const Text('Tanggal: 2024-01-01 12:00:00'),
            const Text('No. Transaksi: #001234'),
            const Divider(),
            const Text('Item:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...cart.map(
              (item) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item['name']} x${item['quantity']}'),
                  Text(
                    'Rp ${((item['price'] as double) * (item['quantity'] as int)).toStringAsFixed(0)}',
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${total.toStringAsFixed(0)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text('Pembayaran: $payment'),
            const Divider(),
            const Center(child: Text('Terima Kasih!')),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Print receipt
                    },
                    icon: const Icon(Icons.print),
                    label: const Text('Cetak'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Send digital receipt
                    },
                    icon: const Icon(Icons.send),
                    label: const Text('Kirim Digital'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: const Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double total;

  const PaymentScreen({super.key, required this.total});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPayment = 'Tunai';
  final _cashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total: Rp ${widget.total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Metode Pembayaran:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Tunai'),
                  value: 'Tunai',
                  groupValue: _selectedPayment,
                  onChanged: (value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('QRIS'),
                  value: 'QRIS',
                  groupValue: _selectedPayment,
                  onChanged: (value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Transfer Bank'),
                  value: 'Transfer',
                  groupValue: _selectedPayment,
                  onChanged: (value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('E-Wallet'),
                  value: 'E-Wallet',
                  groupValue: _selectedPayment,
                  onChanged: (value) {
                    setState(() {
                      _selectedPayment = value!;
                    });
                  },
                ),
              ],
            ),
            if (_selectedPayment == 'Tunai') ...[
              const SizedBox(height: 16),
              TextField(
                controller: _cashController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Bayar',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Text(
                'Kembalian: Rp ${(double.tryParse(_cashController.text) ?? 0) - widget.total}',
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Process payment and navigate to receipt
                Navigator.pushNamed(
                  context,
                  '/receipt',
                  arguments: {
                    'total': widget.total,
                    'payment': _selectedPayment,
                  },
                );
              },
              child: const Text('Konfirmasi Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}

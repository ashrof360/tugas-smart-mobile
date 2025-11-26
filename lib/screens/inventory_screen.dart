import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data
    final products = [
      {'name': 'Indomie Goreng', 'stock': 50, 'alert': false},
      {'name': 'Susu Ultra', 'stock': 5, 'alert': true},
      {'name': 'Kopi Kapal Api', 'stock': 20, 'alert': false},
      {'name': 'Teh Botol', 'stock': 2, 'alert': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Inventori'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'add') {
                // Add new product
              } else if (value == 'price') {
                Navigator.pushNamed(context, '/price_recommendation');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'add', child: Text('Tambah Produk')),
              const PopupMenuItem(
                value: 'price',
                child: Text('Rekomendasi Harga'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(product['name'] as String),
              subtitle: Text('Stok: ${product['stock']}'),
              trailing: (product['alert'] as bool)
                  ? const Icon(Icons.warning, color: Colors.red)
                  : const Icon(Icons.check_circle, color: Colors.green),
              onTap: () {
                // View/edit product details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/stock_prediction');
        },
        child: const Icon(Icons.analytics),
        tooltip: 'Prediksi Stok',
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data
    final customers = [
      {'name': 'John Doe', 'phone': '08123456789', 'points': 150},
      {'name': 'Jane Smith', 'phone': '08198765432', 'points': 200},
      {'name': 'Bob Johnson', 'phone': '08155566677', 'points': 75},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Pelanggan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add new customer
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(customer['name'] as String),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone: ${customer['phone']}'),
                  Text('Poin: ${customer['points']}'),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/customer_detail',
                  arguments: customer,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

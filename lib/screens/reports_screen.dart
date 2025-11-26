import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Penjualan'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Harian'),
            Tab(text: 'Mingguan'),
            Tab(text: 'Bulanan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReportTab('Harian'),
          _buildReportTab('Mingguan'),
          _buildReportTab('Bulanan'),
        ],
      ),
    );
  }

  Widget _buildReportTab(String period) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Laporan $period',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text('Total Penjualan'),
                        Text(
                          'Rp 2,500,000',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text('Jumlah Transaksi'),
                        Text(
                          '120',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Grafik Penjualan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            color: Colors.grey[200],
            child: const Center(child: Text('Grafik Penjualan (Placeholder)')),
          ),
          const SizedBox(height: 24),
          const Text(
            'Produk Terlaris',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('1. Indomie Goreng'),
                  trailing: Text('45 pcs'),
                ),
                ListTile(
                  title: Text('2. Susu Ultra'),
                  trailing: Text('30 pcs'),
                ),
                ListTile(
                  title: Text('3. Kopi Kapal Api'),
                  trailing: Text('25 pcs'),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Export to PDF/Excel
            },
            child: const Text('Ekspor Laporan'),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder prices (will fetch from API)
    final prices = [
      {'mineral': 'Gold', 'price': 65000},
      {'mineral': 'Cassiterite', 'price': 18000},
      {'mineral': 'Coltan', 'price': 25000},
      {'mineral': 'Malachite', 'price': 15000},
      {'mineral': 'Quartz', 'price': 500},
      {'mineral': 'Pyrite', 'price': 1500},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Market Prices'), backgroundColor: Color(0xFF111827)),
      body: Container(
        decoration: BoxDecoration(gradient: RadialGradient(colors: [Color(0xFF0D1B2A), Color(0xFF0A0E17)])),
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: prices.length,
          itemBuilder: (context, index) {
            final item = prices[index];
            return Card(
              color: Color(0xFF111827),
              child: ListTile(
                leading: Icon(Icons.monetization_on, color: Color(0xFFFFD700)),
                title: Text(item['mineral'].toString()),
                subtitle: Text('USD/kg'),
                trailing: Text('\$${item['price']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}

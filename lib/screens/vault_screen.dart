
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder scan history
    final scans = [
      {'mineral': 'Quartz', 'confidence': '92%', 'grade': '45%', 'value': '₦12,500'},
      {'mineral': 'Pyrite', 'confidence': '88%', 'grade': '60%', 'value': '₦5,000'},
      {'mineral': 'Malachite', 'confidence': '85%', 'grade': '55%', 'value': '₦18,000'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('My Vault'), backgroundColor: Color(0xFF111827)),
      body: Container(
        decoration: BoxDecoration(gradient: RadialGradient(colors: [Color(0xFF0D1B2A), Color(0xFF0A0E17)])),
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, index) {
            final scan = scans[index];
            return Card(
              color: Color(0xFF111827),
              child: ListTile(
                leading: Icon(Icons.diamond, color: Color(0xFFFFD700)),
                title: Text(scan['mineral']!),
                subtitle: Text('Confidence: ${scan['confidence']} • Grade: ${scan['grade']}'),
                trailing: Text(scan['value']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}

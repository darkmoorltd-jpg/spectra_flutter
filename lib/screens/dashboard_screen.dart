
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPECTRA', style: GoogleFonts.orbitron(color: Color(0xFFFFD700))),
        backgroundColor: Color(0xFF111827),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Color(0xFF0D1B2A), Color(0xFF0A0E17)]),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome, Miner!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _StatCard(label: 'Scans Left', value: '30')),
                  SizedBox(width: 12),
                  Expanded(child: _StatCard(label: 'Value Found', value: '₦0')),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Open camera/upload
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Scan Mineral'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 24),
              Text('Recent Scans', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.diamond, color: Color(0xFFFFD700)),
                      title: Text('Quartz'),
                      subtitle: Text('Confidence: 92%'),
                      trailing: Text('₦12,500'),
                    ),
                    Divider(color: Colors.grey[800]),
                    ListTile(
                      leading: Icon(Icons.diamond, color: Color(0xFFB87333)),
                      title: Text('Pyrite'),
                      subtitle: Text('Confidence: 88%'),
                      trailing: Text('₦5,000'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF111827),
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF111827),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))),
            SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  const ResultScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    // Simulated result for now (will be replaced with API call)
    String mineral = 'Pyrite';
    double confidence = 0.88;
    double grade = 0.65;
    double valueNgn = 45000;

    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis Result'),
        backgroundColor: Color(0xFF111827),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Color(0xFF0D1B2A), Color(0xFF0A0E17)]),
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(imageFile, height: 200, fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              Text(
                mineral,
                style: GoogleFonts.orbitron(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
              ),
              SizedBox(height: 8),
              _buildConfidenceBar(confidence),
              SizedBox(height: 16),
              Card(
                color: Color(0xFF111827),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildInfoRow('Estimated Grade', '${(grade * 100).toStringAsFixed(0)}%'),
                      Divider(color: Colors.grey[800]),
                      _buildInfoRow('Market Value (₦)', '₦${valueNgn.toStringAsFixed(0)}'),
                      Divider(color: Colors.grey[800]),
                      _buildInfoRow('Market Value (USD)', '\$${(valueNgn / 1500).toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.save),
                      label: Text('Save'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.attach_money),
                      label: Text('Find Buyers'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfidenceBar(double confidence) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Confidence: ${(confidence * 100).toStringAsFixed(1)}%', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 4),
        LinearProgressIndicator(
          value: confidence,
          backgroundColor: Color(0xFF1F2A44),
          color: Color(0xFFFFD700),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}

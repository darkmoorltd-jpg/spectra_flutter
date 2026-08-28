
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF0A0E17)],
            radius: 1.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('⛏️', style: TextStyle(fontSize: 64)),
                SizedBox(height: 8),
                Text('SPECTRA', style: GoogleFonts.orbitron(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))),
                SizedBox(height: 4),
                Text('Know your mineral. Get fair cash.', style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(height: 32),
                Card(
                  color: Color(0xFF111827),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Create Account', style: TextStyle(color: Color(0xFFFFD700))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

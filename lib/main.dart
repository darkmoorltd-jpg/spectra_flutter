
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/market_screen.dart';
import 'screens/vault_screen.dart';
import 'screens/result_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mzxbndfmeuewmbhwiotc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im16eGJuZGZtZXVld21iaHdpb3RjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODc3NjA2MzEsImV4cCI6MjEwMzMzNjYzMX0.QRpTunoZ2bPGYSu5qwWuq8g6G1KjxtoiQ3vTZLWcUvk',
  );
  runApp(const SpectraApp());
}

class SpectraApp extends StatelessWidget {
  const SpectraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPECTRA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFFFD700),
        scaffoldBackgroundColor: Color(0xFF0A0E17),
        textTheme: GoogleFonts.rajdhaniTextTheme(ThemeData.dark().textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFD700),
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/scan': (context) => ScanScreen(),
        '/market': (context) => MarketScreen(),
        '/vault': (context) => VaultScreen(),
      },
    );
  }
}

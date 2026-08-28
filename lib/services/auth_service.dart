
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://mzxbndfmeuewmbhwiotc.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im16eGJuZGZtZXVld21iaHdpb3RjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODc3NjA2MzEsImV4cCI6MjEwMzMzNjYzMX0.QRpTunoZ2bPGYSu5qwWuq8g6G1KjxtoiQ3vTZLWcUvk',
    );
  }

  static Future<AuthResponse> signIn(String email, String password) async {
    return await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<AuthResponse> signUp(String email, String password) async {
    return await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  static User? getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }
}


import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://spectra-api-gr7u.onrender.com';

  static Future<Map<String, dynamic>> predictMineral(File imageFile) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/api/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {'error': 'Failed to get prediction'};
    }
  }

  static Future<List<dynamic>> getScanHistory(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/scans?user_id=$userId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }

  static Future<Map<String, dynamic>> getMarketPrices() async {
    final response = await http.get(Uri.parse('$baseUrl/api/prices'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {};
    }
  }
}

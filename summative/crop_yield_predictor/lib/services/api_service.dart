import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prediction_input.dart';
import 'dart:async';

class ApiService {
  // Configuration for different environments
  static const String baseUrl = 'http://localhost:8000'; // For web development
  // static const String baseUrl = 'http://10.0.2.2:8000'; // For Android emulator
  // static const String baseUrl = 'http://your-server-ip:8000'; // For production

  static Future<double> predictYield(PredictionInput input) async {
    final url = Uri.parse('$baseUrl/predict');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = jsonEncode(input.toJson());

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      ).timeout(const Duration(seconds: 10)); // Add timeout

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['prediction'] != null) {
          return data['prediction'].toDouble();
        } else {
          throw Exception('Invalid response format: prediction field missing');
        }
      } else {
        throw Exception(
          'API Error: ${response.statusCode}\n'
          'Response: ${response.body}'
        );
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on TimeoutException {
      throw Exception('Request timed out. Please check your connection');
    } on FormatException {
      throw Exception('Invalid response format from server');
    } catch (e) {
      throw Exception('Failed to predict yield: ${e.toString()}');
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Optional AI plugin interface for Spin Wheel SDK.
/// Users can implement this to fetch AI-generated content from their backend.
abstract class SpinWheelAIPlugin {
  /// Fetch AI-generated labels for the wheel.
  Future<List<String>> fetchLabels({required String theme, required int count});

  /// Fetch AI-generated image URLs for the wheel.
  Future<List<String>> fetchImageUrls(
      {required String theme, required int count});
}

/// Example implementation of SpinWheelAIPlugin that calls a Python backend.
class HttpSpinWheelAIPlugin implements SpinWheelAIPlugin {
  final String backendUrl;
  HttpSpinWheelAIPlugin({required this.backendUrl});

  @override
  Future<List<String>> fetchLabels(
      {required String theme, required int count}) async {
    final response = await http.post(
      Uri.parse('$backendUrl/generate-labels'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'theme': theme, 'count': count}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(data['labels'] ?? []);
    } else {
      throw Exception('Failed to fetch AI labels: ${response.body}');
    }
  }

  @override
  Future<List<String>> fetchImageUrls(
      {required String theme, required int count}) async {
    final response = await http.post(
      Uri.parse('$backendUrl/generate-images'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'theme': theme, 'count': count}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(data['imageUrls'] ?? []);
    } else {
      throw Exception('Failed to fetch AI image URLs: ${response.body}');
    }
  }
}

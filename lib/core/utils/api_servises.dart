import 'package:dio/dio.dart';

class ApiServises {
  ApiServises(this._dio);

  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  Dio _dio;
  Future<Map<String, dynamic>> get(String endPoint) async {
    try {
      final response = await _dio.get(_baseUrl + endPoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}

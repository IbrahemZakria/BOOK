import 'package:book/core/widgts/UserMessage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServises {
  final  Dio _dio = Dio();
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<dynamic> getData(String endpoint) async {
    try {
      Response response = await _dio.get(_baseUrl+endpoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<dynamic> postData({
    required String endpoint,
    @required Map<String, dynamic>? data,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    try {
      Response response = await _dio.post(
        (_baseUrl+endpoint),
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  } //////////////////////////////////////////////////////////////////////////////

  Future<dynamic> updatetData({
    required String endpoint,
    @required Map<String, dynamic>? data,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': '*/*',
    };
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    try {
      Response response = await _dio.put(
        (_baseUrl+endpoint),
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        Usermessage.show(
          message: "updated sucssesfully",
          backgroundColor: Colors.green,
        );
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;

        return responseData;
      } else {
        throw Exception('Failed to update  data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update  data: $e');
    }
  }
}

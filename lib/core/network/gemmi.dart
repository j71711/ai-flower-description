import 'dart:convert';
import 'package:ai/core/network/api_endpoints.dart';
import 'package:ai/core/network/dio_client.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

extension GimmeExtension on DioClient {
  Future<String> postResponse(String imagePath) async {
  try {
    final data = await rootBundle.load(imagePath);
    final base64Image = base64.encode(data.buffer.asUint8List());

    final response = await dio.post(
      ApiEndpoints.baseUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
       'x-goog-api-key': dotenv.env['GEMINI_API_KEY'],
        },
      ),
      data: {
        "contents": [
          {
            "parts": [
              {
                "text": "Generate one short caption for this image"
              },
              {
                "inlineData": {
                  "mimeType": "image/jpeg",
                  "data": base64Image,
                }
              }
            ]
          }
        ]
      },
    );

    final text =
        response.data['candidates'][0]['content']['parts'][0]['text'];

    return text.toString().trim();

  } catch (error) {
    print(error);
    rethrow;
  }
}
}
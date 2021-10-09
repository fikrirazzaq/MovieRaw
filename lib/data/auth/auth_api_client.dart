import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_starter_app/data/auth/auth_api_path.dart';
import 'package:movies_starter_app/data/auth/model/guest_response.dart';
import 'package:movies_starter_app/data/movies/remote/movie_api_client.dart';

import '../dio_logging.dart';

const String KEY_GUEST_SESSION_ID = 'GUEST_SESSION_ID';

class AuthApiClient {
  final storage = FlutterSecureStorage();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 30000,
      sendTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  Future<GuestResponse?> loginAsGuest() async {
    GuestResponse? guestResponse;
    try {
      Response response = await _dio.get(LOGIN_GUEST, queryParameters: {
        'api_key': API_KEY,
      });

      print('RESPONSE LOGIN: ${response.data}');

      guestResponse = GuestResponse.fromJson(response.data);

      await storage.write(
          key: KEY_GUEST_SESSION_ID, value: guestResponse.guestSessionId);
    } on DioError catch (e) {
      if (e.response != null) {
        print(
            'Error(loginAsGuest): ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        print('Something went wrong: ${e.message}');
      }
    }

    return guestResponse;
  }

  Future<GuestResponse?> loginUserNamePassword() async {
    GuestResponse? guestResponse;
    try {
      Response response = await _dio.get(LOGIN_GUEST, queryParameters: {
        'api_key': API_KEY,
      });

      print('RESPONSE LOGIN: ${response.data}');

      guestResponse = GuestResponse.fromJson(response.data);

      await storage.write(
          key: KEY_GUEST_SESSION_ID, value: guestResponse.guestSessionId);
    } on DioError catch (e) {
      if (e.response != null) {
        print(
            'Error(loginAsGuest): ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        print('Something went wrong: ${e.message}');
      }
    }

    return guestResponse;
  }
}

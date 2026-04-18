import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:siha_health_doctor_side/config/utils/navigatorKey.dart';

Dio callDio() {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          final message = data['message'];

          if (message != null) {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                content: Text(message.toString()),
                backgroundColor: Color(0xFF067594),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
              ),
            );
          }
        }
        return handler.next(response);
      },
      onError: (error, handler) {
        final data = error.response?.data;

        if (data is Map<String, dynamic>) {
          final message = data['message'];

          if (message != null) {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                content: Text(message.toString()),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
              ),
            );
          }
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
}

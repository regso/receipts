import 'dart:io';

import 'package:dio/dio.dart';

import 'constants.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: Constants.apiBaseUrl,
    headers: {
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.acceptLanguageHeader: Constants.acceptLanguageHeader,
      HttpHeaders.userAgentHeader: Constants.userAgentHeader,
      HttpHeaders.refererHeader: Constants.refererHeader,
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 60),
  ),
);

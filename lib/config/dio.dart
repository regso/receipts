import 'dart:io';

import 'package:dio/dio.dart';

import 'constants.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: Constants.apiBaseUrl,
    headers: {
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.acceptLanguageHeader: Constants.httpAcceptLanguageHeader,
      HttpHeaders.userAgentHeader: Constants.httpUserAgentHeader,
      HttpHeaders.refererHeader: Constants.httpRefererHeader,
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 60),
  ),
);

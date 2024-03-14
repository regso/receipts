import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:receipts/config/receipts_app.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';

final sl = GetIt.instance;

void main() async {
  HttpOverrides.global = TempHttpOverrides();
  runApp(BlocProvider<AppBloc>(
    create: (BuildContext context) {
      return AppBloc()..add(const LoadAppEvent());
    },
    child: const ReceiptsApp(),
  ));
}

// TODO: temporary ignore verify ssl certificate
class TempHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

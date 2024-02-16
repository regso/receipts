import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/config/receipts_app.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';

void main() async {
  await initApp();
  runApp(BlocProvider<AppBloc>(
    create: (BuildContext context) {
      return AppBloc()..add(const AuthorizeAppEvent());
    },
    child: const ReceiptsApp(),
  ));
}

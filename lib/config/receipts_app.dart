import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_route_parser.dart';
import 'package:receipts/config/routes/app_router_delegate.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';

class ReceiptsApp extends StatelessWidget {
  const ReceiptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        if (state is InitializingAppState) {
          return Container(
            color: AppTheme.accentColor,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is ErrorInitAppState) {
          return const Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text('Error'),
            ),
          );
        }

        return MaterialApp.router(
          title: 'Receipts App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerDelegate: AppRouterDelegate(
            defaultPageSlug: AppPageSlug.receipts,
          ),
          routeInformationParser: AppRouteParser(
            defaultPageSlug: AppPageSlug.receipts,
          ),
        );
      },
    );
  }
}

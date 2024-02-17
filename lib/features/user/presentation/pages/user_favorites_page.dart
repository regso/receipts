import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/app/presentation/widgets/navigation_bar_widget.dart';

class UserFavoritesPage extends StatelessWidget {
  const UserFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: const SafeArea(
            child: Center(child: Text('Favorites')),
          ),
          bottomNavigationBar: NavigationBarWidget(
            currentPageSlug: AppPageSlug.userFavorites,
            appState: state,
          ),
        );
      },
    );
  }
}

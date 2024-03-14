import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/app/presentation/widgets/navigation_bar_widget.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_event.dart';
import 'package:receipts/features/receipts/presentation/widgets/receipts_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: SafeArea(
            child: BlocProvider<ReceiptsBloc>(
              create: (BuildContext context) {
                final bloc = ReceiptsBloc();
                if (state is AuthorizedUserAppState) {
                  bloc.add(LoadReceiptsEvent(
                    isFavorites: true,
                    userId: state.userId,
                  ));
                } else {
                  bloc.add(const LoadReceiptsEvent());
                }
                return bloc;
              },
              child: const ReceiptsWidget(),
            ),
          ),
          bottomNavigationBar: const NavigationBarWidget(
            currentPageSlug: AppPageSlug.favorites,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_router_delegate.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:receipts/features/app/presentation/widgets/navigation_bar_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          backgroundColor: AppTheme.accentColor,
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 232,
                        child: SignInForm(),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.inverseTextColor,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: Text(Labels.authSignInRegistration),
                    onPressed: () {
                      (Router.of(context).routerDelegate as AppRouterDelegate)
                          .open(pageSlug: AppPageSlug.authSignUp);
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: NavigationBarWidget(
            currentPageSlug: AppPageSlug.authSignIn,
            appState: state,
          ),
        );
      },
    );
  }
}

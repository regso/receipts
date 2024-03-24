import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
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
        return SafeArea(
          top: false,
          left: false,
          right: false,
          child: Scaffold(
            backgroundColor: AppTheme.accentColor,
            body: const SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      SizedBox(
                        width: 232,
                        child: SignInForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const NavigationBarWidget(
              currentPageSlug: AppPageSlug.authSignIn,
            ),
          ),
        );
      },
    );
  }
}

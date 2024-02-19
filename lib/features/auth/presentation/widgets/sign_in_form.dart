import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/auth/domain/usecases/authenticate_use_case.dart';
import 'package:receipts/features/auth/presentation/widgets/text_input_widget.dart';
import 'package:receipts/main.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _key = GlobalKey<FormState>();
  String? _login;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (
      BuildContext context,
      AppState state,
    ) {
      return Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Labels.receipts,
              style: TextStyle(
                fontSize: 30,
                color: AppTheme.inverseTextColor,
              ),
            ),
            const SizedBox(height: 70),
            TextInputWidget(
              hint: Labels.authSignInLogin,
              iconData: Icons.person,
              validator: (String? value) {
                _login = value;
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextInputWidget(
              hint: Labels.authSignInPassword,
              iconData: Icons.lock,
              validator: (String? value) {
                _password = value;
                return null;
              },
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                minimumSize: const Size(232, 48),
                backgroundColor: AppTheme.mainBackgroundColor,
              ),
              child: Text(
                Labels.authSignInSubmit,
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.inverseTextColor,
                ),
              ),
              onPressed: () {
                if (!_key.currentState!.validate()) {
                  return;
                }

                sl<AuthenticateUseCase>()(
                  login: _login ?? '',
                  password: _password ?? '',
                ).then((int? userId) {
                  if (userId != null) {
                    BlocProvider.of<AppBloc>(context)
                        .add(AuthorizeAppEvent(userId: userId, token: ''));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(Labels.authSignInErrorAuth)),
                    );
                  }
                });
              },
            ),
          ],
        ),
      );
    });
  }
}

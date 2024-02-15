import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/auth/presentation/widgets/text_input_widget.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(height: 16),
          TextInputWidget(
            hint: Labels.authSignInPassword,
            iconData: Icons.lock,
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
            onPressed: () {},
          ),
          // OutlinedButton(
          //   style: ButtonStyle(backgroundColor: Colors.red), // AppTheme.mainBackgroundColor),
          //   child: Text(Labels.signIn),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}

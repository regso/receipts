import 'package:receipts/config/routes/app_page.dart';

sealed class AppState {
  const AppState();
}

class InitAppState extends AppState {
  const InitAppState();
}

class AuthorizedUserAppState extends AppState {
  final AppPageSlug defaultPageSlug;
  final int userId;
  final String token;

  const AuthorizedUserAppState({
    required this.defaultPageSlug,
    required this.userId,
    required this.token,
  });
}

class UnAuthorizedUserAppState extends AppState {
  const UnAuthorizedUserAppState();
}

class ErrorAppState extends AppState {
  const ErrorAppState();
}

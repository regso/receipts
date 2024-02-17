import 'package:receipts/config/routes/app_page.dart';

sealed class AppState {
  const AppState();
}

class InitializingAppState extends AppState {
  const InitializingAppState();
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

class ErrorInitAppState extends AppState {
  const ErrorInitAppState();
}

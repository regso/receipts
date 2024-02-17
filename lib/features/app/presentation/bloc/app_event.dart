sealed class AppEvent {
  const AppEvent();
}

class LoadAuthorizationAppEvent extends AppEvent {
  const LoadAuthorizationAppEvent();
}

class AuthorizeAppEvent extends AppEvent {
  final int? userId;
  final String? token;

  const AuthorizeAppEvent({this.userId, this.token});
}

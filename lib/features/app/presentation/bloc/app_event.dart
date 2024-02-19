sealed class AppEvent {
  const AppEvent();
}

class LoadAppEvent extends AppEvent {
  const LoadAppEvent();
}

class AuthorizeAppEvent extends AppEvent {
  final int? userId;
  final String? token;

  const AuthorizeAppEvent({this.userId, this.token});
}

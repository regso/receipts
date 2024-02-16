import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const InitAppState()) {
    on<AuthorizeAppEvent>(_authorize);
  }

  void _authorize(AuthorizeAppEvent event, Emitter<AppState> emit) async {
    emit(const InitAppState());
    // TODO: complete
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthorizedUserAppState(
      defaultPageSlug: AppPageSlug.receipts,
      userId: 1,
      token: 'abc123',
    ));
    // emit(const UnAuthorizedUserAppState());
  }
}

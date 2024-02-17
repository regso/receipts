import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const InitializingAppState()) {
    on<LoadAuthorizationAppEvent>(_loadAuthorization);
    on<AuthorizeAppEvent>(_authorize);
  }

  void _loadAuthorization(
    LoadAuthorizationAppEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(const UnAuthorizedUserAppState());
  }

  void _authorize(AuthorizeAppEvent event, Emitter<AppState> emit) async {
    if (event.userId != null && event.token != null) {
      emit(AuthorizedUserAppState(
        defaultPageSlug: AppPageSlug.receipts,
        userId: event.userId!,
        token: event.token!,
      ));
    } else {
      emit(const UnAuthorizedUserAppState());
    }
  }
}

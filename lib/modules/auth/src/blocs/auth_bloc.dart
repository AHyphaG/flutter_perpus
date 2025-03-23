import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      final token = await authService.login(event.email, event.password);
      if (token != null) {
        emit(AuthSuccess(token: token));
      } else {
        emit(
          AuthFailure(message: "Login gagal. Username atau password salah."),
        );
      }
    });
  }
}

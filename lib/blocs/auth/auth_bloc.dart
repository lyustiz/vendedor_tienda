import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/usuario.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRep = AuthRepository();

  AuthBloc() : super(const AuthInitial()) {
    on<AuthLogin>((event, emit) => _onLogin(event, emit));
    on<AuthLogout>((event, emit) => _onLogout(event, emit));
  }

  void _onLogin(event, emit) async {
    emit(const AuthLoading(message: 'Autenticando Usuario ...'));

    ResultLogin login =
        ResultLogin(isLogged: false, isSync: false, message: '');

    if (event.usuario == null || event.password == null) {
      emit(const AuthError(error: 'Usuario o Password invalido'));
    }

    try {
      login =
          await authRep.login(usuario: event.usuario, password: event.password);
    } catch (errorMessage) {
      emit(AuthError(error: errorMessage.toString()));
    }

    if (login.isLogged) {
      emit(AuthLogged(usuario: login.usuario!));
    } else {
      if (state is AuthLoading) {
        emit(const AuthError(error: 'Documento o Contraseña Invalidos'));
      }
    }
  }

  void _onLogout(event, emit) async {
    emit(const Logout());
  }
}
